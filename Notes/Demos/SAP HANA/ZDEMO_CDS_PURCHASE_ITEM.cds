@AbapCatalog.sqlViewName: 'ZDEMO_PUR_ITEM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Document Item'
define view ZDEMO_CDS_PURCHASE_ITEM as select from ekpo
{
    key ebeln as Purchasing_Document_Number,
    key ebelp as Item_Number,
    loekz as Deletion_Indicator,
    statu as Status,
    aedat as Change_Date,
    txz01 as Short_Text,
    matnr as Material_Number,
    ematn as Material_number2,
    bukrs as Company_Code,
    werks as Plant,
    lgort as Storage_Location,
    bednr as Req_Tracking_Number,
    matkl as Material_Group,
    menge as Purchase_Order_Quantity,
    meins as Unit_Of_Measure,
    netwr as Net_Order_Value    
}