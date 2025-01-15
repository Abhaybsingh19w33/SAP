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