"=First create the  basic view 
==================
@AbapCatalog.sqlViewName: 'ZDEMO_PUR_DATA'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Data(ekko ekpo join)'
define view ZDEMO_CDS_PURCHASE_DATA 
with parameters Purc_Doc_No : abap.char( 10 )
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
    item.Req_Tracking_Number
} where header.Purchasing_Document_Number = :Purc_Doc_No


===========Extend the basic view ==================================

@AbapCatalog.sqlViewAppendName: 'ZDEMO_PUR_EXV1'
@EndUserText.label: 'Purchase Data Extension View1'
extend view ZDEMO_CDS_PURCHASE_DATA with ZDEMO_CDS_PURCHASE_EX_V1
{
    header.language_key
}

=========== SE38 ==================================

*SELECT can't be used on Extension view
*SELECT *
*    FROM ZDEMO_CDS_PURCHASE_EX_V1
*    INTO TABLE @DATA(it_purchase_data_ext).
