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

// " ____________________________________________________

@AbapCatalog.sqlViewName: 'ZVSK_CDS_PARA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ZVK_CDS_PARAMETERS'
define view ZVK_CDS_PARAMETERS
    with parameters PCARRID : s_carr_id   " DATA ELEMENT
as select from scarr {
    carrid,
    carrname,
    currcode,
     url
} where carrid = :PCARRID
________________________________________

REPORT Z.

SELECT *
    FROM zdemo_cds_purchase_data( purc_doc_no = '4500000021' )
    INTO TABLE @DATA(it_purchase_data).

IF sy-subrc = 0.
  cl_demo_output=>display( it_purchase_data ).
ENDIF.

The hardcoded value can be a parameter in SE38
_______________________________________________________
REPORT z.
PARAMETERS PSCARRID TYPE S_CARR_ID.
SELECT * FROM
  ZVK_CDS_PARAMETERS( PCARRID = @PSCARRID )
   INTO TABLE @DATA(IT_TAB).

CL_DEMO_OUTPUT=>DISPLAY(  IT_TAB ).
