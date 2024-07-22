@AbapCatalog.sqlViewName: 'ZDEMO_PUR_DATA'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Data(ekko ekpo join)'
define view ZDEMO_CDS_PURCHASE_DATA 
with parameters Purc_Doc_No : abap.char( 10 ),
                target_cur  : abap.cuky( 5 )
//                exchnage_rate_date : abap.dats    
as select from ZDEMO_CDS_PURCHASE_HEADER as header
left outer join ZDEMO_CDS_PURCHASE_ITEM as item
    on header.Purchasing_Document_Number = item.Purchasing_Document_Number
{
    header.Purchasing_Document_Number,
    header.Company_Code,
    header.Purchasing_Document_Category,
    header.Purchasing_Document_Type,
    header.Control_indicator,
    header.Deletion_Indicator,
    header.Status,
    header.Creation_Date,
    header.Person_Responsible,
    header.Item_Number_Interval,
    header.Last_Item_Number,
    header.Vendor_account_number,
    @Semantics.currencyCode: true  
    header.Currency_Key,
    item.Item_Number,
    item.Deletion_Indicator as item_deletion_indicator,
    item.Status as item_status,
    item.Change_Date,
    item.Short_Text,
    item.Material_Number,
    item.Material_number2,
    item.Company_Code as item_company_code,
    item.Plant,
    item.Storage_Location,
    item.Req_Tracking_Number,
    item.Material_Group,
    @Semantics.quantity.unitOfMeasure: 'Unit_Of_Measure'
    item.Purchase_Order_Quantity,
    @Semantics.unitOfMeasure: true
    item.Unit_Of_Measure,
    @Semantics.amount.currencyCode: 'Currency_Key'
    item.Net_Order_Value,
    currency_conversion( amount => Net_Order_Value,
                       source_currency => Currency_Key,
                       target_currency => :target_cur, 
                       exchange_rate_date => Creation_Date ) as Target_Amount,
    :target_cur as Target_Amount_cur
} where header.Purchasing_Document_Number = :Purc_Doc_No


==================SE38 PROGRAM=================

SELECT *
    FROM zdemo_cds_purchase_data( purc_doc_no = '4500000021',
                                  target_cur = 'CAD'
*                                  exchnage_rate_date = '20230309'
                                  )
    INTO TABLE @DATA(it_purchase_data).

IF sy-subrc = 0.
  cl_demo_output=>display( it_purchase_data ).
ENDIF.