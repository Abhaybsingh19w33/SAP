Building OData Services [13] : Create Data using Deep Entity
Date: November 10, 2022
Author: Jagdish
0 Comments


Pause

Unmute
Remaining Time -30:29

Fullscreen

Settings
Now Playing

Play Video
Learn DynamoDB Data Modeling

Share
Watch onHumix
In this post, you will learn about handling Deep Structures in OData. We need to handle data with a hierarchy with deep structures while reading the data for the front-end applications and also while creating the data in SAP. This earlier post Handle Deep Structures using $expand was about with reading the data. This one will deal with creating the data.

The scenario considered is the same as the earlier post which also has the project creation details.


For creating / updating the data using deep strcuture, method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_DEEP_ENTITY needs to be redefined.


Here is a sample code that can be used to implement Sales Order create a scenario using a BAPI. Here, using the key VBELN for the header entity, it can be checked whether it’s a ‘create scenario’ or an ‘update scenario’, and accordingly the BAPI can be called. I have only added code with CREATE BAPI and the code for UPDATE BAPI is something that you can write if needed.

Code Reference
METHOD /iwbep/if_mgw_appl_srv_runtime~create_deep_entity.

  DATA : ls_so_all TYPE zcl_g00_jp_so_mpc_ext=>ty_so_all.

  DATA : ls_header_in TYPE bapisdhd1,
         lt_items     TYPE STANDARD TABLE OF bapisditm,
         lt_partners  TYPE STANDARD TABLE OF bapiparnr,
         lt_return    TYPE STANDARD TABLE OF bapiret2.

  io_data_provider->read_entry_data( IMPORTING es_data = ls_so_all ).

  IF ls_so_all-vbeln IS INITIAL.

    ls_header_in-doc_type = 'ZOR1'.
    ls_header_in-doc_date = ls_so_all-erdat.
    ls_header_in-created_by = ls_so_all-ernam.
    ls_header_in-currency = ls_so_all-waerk.
    ls_header_in-sales_org = ls_so_all-vkorg.
    ls_header_in-distr_chan = ls_so_all-vtweg.
    ls_header_in-division = ls_so_all-spart.

    lt_partners = VALUE #( ( partn_role = 'AG'
                             partn_numb = ls_so_all-kunnr ) ).

    lt_items = VALUE #( FOR ls_item IN ls_so_all-toitem
                        ( itm_number = ls_item-posnr
                          material   = ls_item-matnr
                          short_text = ls_item-arktx
                          target_qty = ls_item-zmeng
                          target_qu  = ls_item-meins
                          plant      = ls_item-werks
                          store_loc  = ls_item-lgort
                          ship_point = ls_item-vstel
                          route      = ls_item-route
                        )
                      ).

    DATA : lv_vbeln TYPE vbak-vbeln.
    CALL FUNCTION 'BAPI_SALESORDER_CREATEFROMDAT2'
      EXPORTING
        order_header_in = ls_header_in
      IMPORTING
        salesdocument   = lv_vbeln
      TABLES
        return          = lt_return
        order_items_in  = lt_items
        order_partners  = lt_partners.

    IF NOT line_exists( lt_return[ type = 'E' ] ).
      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'.
    ELSE.
      "Raise Exception
    ENDIF.

    ls_so_all-vbeln = lv_vbeln.

    me->copy_data_to_ref(
       EXPORTING
         is_data = ls_so_all
       CHANGING
         cr_data = er_deep_entity ).

  ELSE.
    "Update Scenario
    "Call change BAPI - BAPI_SALESORDER_CHANGE

    "Handle Business Exception
    DATA(lo_msg) = me->/iwbep/if_mgw_conv_srv_runtime~get_message_container( ).
    lo_msg->add_message( iv_msg_type   = /iwbep/cl_cos_logger=>error
                         iv_msg_id     = 'ZG00_PO'
                         iv_msg_number = '004' ).

    RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
        EXPORTING
        message_container = lo_msg .

    RAISE EXCEPTION NEW /iwbep/cx_mgw_busi_exception(
        message_container = lo_msg ).

  ENDIF.

ENDMETHOD.
Important Code blocks
io_data_provider->read_entry_data is used to read the data from the request

The entity data updated with Sales Order Number is passed back using below code.

    me->copy_data_to_ref(
       EXPORTING
         is_data = ls_so_all
       CHANGING
         cr_data = er_deep_entity ).
Usually, one project will have one deep entity, but in case there are multiple deep entities then the entity type name should be first checked using method GET_ENTITY_TYPE_NAME from IO_TECH_REQUEST_CONTEXT
Advertisements
Ezoic

Testing using Gateway Client
Observe the code. Only Header and Item data are used from the deep structure to pass data to the BAPI. So, the request payload needs to have that information.

To get the details, first execute a GET request with $expand=ToItem. Then, use the data as Request payload using the button Use as Request.

URI : /sap/opu/odata/SAP/ZG00_JP_SO_SRV/SOHeaderSet(‘109’)?$expand=ToItem&$format=json


Alternatively, below well formatted payload can also be used.

{
  "Vbeln" : "",
  "Erdat" : "\/Date(1660694400000)\/",
  "Erzet" : "PT02H09M41S",
  "Ernam" : "RAP50",
  "Netwr" : "4000.00",
  "Waerk" : "USD",
  "Vkorg" : "1710",
  "Vtweg" : "10",
  "Spart" : "00",
  "Kunnr" : "101",
  "ToItem" : [
    {
      "Vbeln" : "",
      "Posnr" : "000010",
      "Matnr" : "FG1_CP",
      "Arktx" : "CP-FG Shaft with Rolling Bearings",
      "Zmeng" : "10",
      "Meins" : "PC",
      "Netwr" : "4000.00",
      "Waerk" : "USD",
      "Werks" : "1710",
      "Lgort" : "",
      "Vstel" : "1710",
      "Route" : ""
    }
  ]
}
Execute the request as below.


As the sales order number is passed, it is interpreted as an Update scenario that is not implemented as per the code, and hence exception is triggered. Note that even though this is an update scenario, the method used here is POST and not PUT.


Now, remove the sales order number from the payload and execute again.


Advertisements
Ezoic
The order gets created. The result that you will get would depend on the data and configuration in your system.



This marks the end of this post.