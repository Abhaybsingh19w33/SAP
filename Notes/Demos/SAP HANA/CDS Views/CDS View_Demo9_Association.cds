@AbapCatalog.sqlViewName: 'ZDEMO_PUR_ASSOC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Data Association'
define view ZDEMO_CDS_PURCHASE_ASSOC as select from ZDEMO_CDS_PURCHASE_HEADER as header
association [1] to ZDEMO_CDS_PURCHASE_ITEM as _purchase_item
    on $projection.Purchasing_Document_Number = _purchase_item.Purchasing_Document_Number
{
    key header.Purchasing_Document_Number,
//    key _purchase_item.Item_Number,
//    _purchase_item.Deletion_Indicator,
//    _purchase_item.Status,
//    _purchase_item.Change_Date,
//    _purchase_item.Short_Text,
//    _purchase_item.Material_Number,
//    _purchase_item.Material_number2,
//    _purchase_item.Company_Code,
//    _purchase_item.Plant,
//    _purchase_item.Storage_Location,
//    _purchase_item.Req_Tracking_Number,
    _purchase_item // Make association public
}

// ====================SE38 PROGRAM==============

SELECT
    purchasing_document_number,
    \_purchase_item-item_number AS item_number,
    \_purchase_item-deletion_indicator AS deletion_indicator,
    \_purchase_item-status AS status,
    \_purchase_item-change_date AS change_date,
    \_purchase_item-short_text AS short_text,
    \_purchase_item-material_number AS material_number,
    \_purchase_item-material_number2 AS material_number2,
    \_purchase_item-company_code AS company_code,
    \_purchase_item-plant AS plant,
    \_purchase_item-storage_location AS storage_location,
    \_purchase_item-req_tracking_number AS req_tracking_number
    FROM zdemo_cds_purchase_assoc
    INTO TABLE @DATA(it_purchase_data_assoc).

IF sy-subrc = 0.
  cl_demo_output=>display( it_purchase_data_assoc ).
ENDIF.


