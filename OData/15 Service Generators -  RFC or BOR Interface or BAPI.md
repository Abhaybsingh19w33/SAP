# Building OData Services [15] : Service Generators – RFC/ BOR Interface / BAPI

I did not understand what is the flow here

In this post, you will learn about the Service Generators i.e. Creating a Service using existing objects like Search Help, BAPI, or BOR Objects. To manage the length of the post, this is split into 2 parts. This is the second part.

- How to create OData Service using Search Help i.e. Import Search Help in SEGW
- How to create OData Service using BAPI / BOR object i.e. Import BAPIs in SEGW

## Create Entity from BAPI

Right-click on Data Model and choose Import > RFC/BOR Interface. In this example, BAPI BAPI_PO_GETITEMS is used.

![alt text](image-222.png)

In the Data Source Attributes, Type is selected Remote Function Call as BAPIs are RFCs. Provide the BAPI name as well and click Next.

![alt text](image-223.png)

Select PO Items and Click Next.

![alt text](image-224.png)

Select keys and click Finish.

![alt text](image-225.png)

The entity is imported.

![alt text](image-226.png)

## Map Query Operation to BAPI

Right-click on GetEntity(Query) under Service Implementation > POItemsSet and choose Map to Data Source.

![alt text](image-227.png)

Chose Target System as Local. Type as Remote Function Call and BAPI_PO_GETITEMS as the Name.

![alt text](image-228.png)

This is the same as before where the Entity Type is created. The below mapping screen is loaded. Click on Propose Mapping to automatically generate the mapping.

![alt text](image-229.png)

The mapping would be generated automatically.

![alt text](image-230.png)

After this, the primary key of the BAPI i.e. PO Number must be mapped manually. Click the icon to insert a row.

![alt text](image-231.png)

Use F4 to complete the mapping as below.

![alt text](image-232.png)

Generate the project.

![alt text](image-233.png)

Test with the below URL. As PoNumber is mapped to BAPI, we need to provide the number.

```
/sap/opu/odata/SAP/ZJP_DEMO_GENERATORS_SRV/PoItemsSet?$filter=PoNumber eq '4500000011'&$format=json
```

![alt text](image-234.png)

Similar steps can be used to map other operations as well.

## Mapping using BOR Object

This is very similar to BAPI. The only difference is that the field names would differ and instead of BAPI name, a method from BOR needs to be selected.

![alt text](image-235.png)

Expand PurchaseOrder Object, and then choose method GetItems.

![alt text](image-236.png)

The method name would appear as below.

![alt text](image-237.png)

The next step where blank mapping appears, clicking on Propose Mapping etc remain the same.

![alt text](image-238.png)

In both methods, the right BAPI OR right method needs to be selected as per the operation.

## Conclusion
It is possible to use BAPI/BOR to create entities and implement operations.

I personally like to use the BAPI only to create the Entity and then implement the operation in DPC_EXT as it gives more flexibility and it's easy to maintain as well.