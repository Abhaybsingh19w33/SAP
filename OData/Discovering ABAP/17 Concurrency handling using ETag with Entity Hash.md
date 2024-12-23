# Building OData Services [17] : Concurrency handling using ETag with Entity Hash 

In this post, you will learn about Concurrency handling in OData Services using etags and different ways to implement etags in SAP.

ETags can also be managed using a field like a timestamp. This concept is covered in the post, [Building OData Services [16] : Concurrency handling using ETag with timestamp field](https://discoveringabap.com/2022/11/17/building-odata-services-16-concurrency-handling-using-etag-with-timestamp-field/)

## Implementing ETAG with an Entity Hash

1. Create a table with a hash field.

The hash field need not be put in the table but can be simply generated in the READ / GetEntity method. For simplicity and visualization

![alt text](/OData/Discovering%20ABAP/Images/image-257.png)

![alt text](/OData/Discovering%20ABAP/Images/image-258.png)

2. Create Project & Entity based on the table

![alt text](/OData/Discovering%20ABAP/Images/image-259.png)

3. Set up the ETag field for the Entity

![alt text](/OData/Discovering%20ABAP/Images/image-260.png)

4. Generate the project.

![alt text](/OData/Discovering%20ABAP/Images/image-261.png)

5. Create a new method to get a hash value for the entity. This can be created in the DPC_EXT class or in a separate utility class

![alt text](/OData/Discovering%20ABAP/Images/image-262.png)

Code reference

```
METHOD calculate_hash.

  DATA : lv_str TYPE xstring.
  EXPORT id = pi_data TO DATA BUFFER lv_str.

  CALL FUNCTION 'CALCULATE_HASH_FOR_RAW'
    EXPORTING
*     ALG            = 'SHA1'
      data           = lv_str
    IMPORTING
      hash           = pe_hash_160
    EXCEPTIONS
      unknown_alg    = 1
      param_error    = 2
      internal_error = 3
      OTHERS         = 4.
  IF sy-subrc <> 0.
    CLEAR pe_hash_160.
  ENDIF.

ENDMETHOD.
```

6. Implement Read and Update operations i.e. methods CUSTOMERSET_GET_ENTITY and CUSTOMERSET_UPDATE_ENTITY

The hash needs to be calculated in the READ operation.

![alt text](/OData/Discovering%20ABAP/Images/image-263.png)

```
METHOD customerset_get_entity.

  DATA customer TYPE zcl_jp_etag_hash_mpc=>ts_customer.
  TRY.
      io_tech_request_context->get_converted_keys(
        IMPORTING es_key_values = customer ).

      SELECT SINGLE FROM zjp_customer1
        FIELDS *
        WHERE customerid = @customer-customerid
        INTO CORRESPONDING FIELDS OF @er_entity.
      IF sy-subrc EQ 0.
        er_entity-etag = me->calculate_hash( er_entity ).
      ENDIF.
    CATCH cx_sy_itab_line_not_found.
  ENDTRY.

ENDMETHOD.
```

In case you have the hash field in the table you can update the hash as well.

![alt text](/OData/Discovering%20ABAP/Images/image-264.png)

```
METHOD customerset_update_entity.

  io_data_provider->read_entry_data( IMPORTING es_data = er_entity ).

  DATA lv_short_time_stamp TYPE timestamp.
  GET TIME STAMP FIELD lv_short_time_stamp.

  er_entity-changetime = lv_short_time_stamp.
  er_entity-etag       = me->calculate_hash( er_entity ).

  MODIFY zjp_customer1 FROM er_entity.
  IF sy-subrc NE 0.
    CLEAR er_entity.
  ENDIF.

ENDMETHOD.
```

Implementing ETAG with a Partial-Entity Hash
In this method, the only change is in the method that generates the hash. Pass a structure that has only the required fields from the entity type that are required for hash calculation. The same fields should be used in READ / UPDATE etc.

![alt text](/OData/Discovering%20ABAP/Images/image-265.png)

## Testing ETag with Hash

Use Gateway Client (/IWFND/GW_CLIENT) to test the service.

Test GET/READ operation

```
Request URI /sap/opu/odata/SAP/ZJP_ETAG_HASH_SRV/CustomerSet('01')?$format=json
```
![alt text](/OData/Discovering%20ABAP/Images/image-266.png)

Use the ETag and payload from the response to create and execute a PUT request.

```
Request URI : /sap/opu/odata/SAP/ZJP_ETAG_HASH_SRV/CustomerSet('01')
Payload:
{
  "Customerid" : "01",
  "Customername" : "Iron Man 1",
  "Changetime" : "\/Date(1666707359000)\/",
  "Etag" : "A2F1E2DAD4BE6AAAC7BD2C738187E787AAC87D10"
}
```

Add a new header with Name If-Match and Value as the ETag from the response.

![alt text](/OData/Discovering%20ABAP/Images/image-267.png)

Request

![alt text](/OData/Discovering%20ABAP/Images/image-268.png)

Response

![alt text](/OData/Discovering%20ABAP/Images/image-269.png)

The same request when executed again gives an error as the hash no longer matches.

![alt text](/OData/Discovering%20ABAP/Images/image-270.png)