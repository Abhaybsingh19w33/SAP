@AbapCatalog.sqlViewName: 'ZDEMO_PUR_HDR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Document Header'
define view ZDEMO_CDS_PURCHASE_HEADER as select from ekko
{
    key ebeln as Purchasing_Document_Number,
    bukrs as Company_Code,
    bstyp as Purchasing_Document_Category,
    bsart as Purchasing_Document_Type,
    bsakz as Control_indicator,
    loekz as Deletion_Indicator,
    statu as Status,
    aedat as Creation_Date,
    ernam as Person_Responsible,
    pincr as Item_Number_Interval,
    lponr as Last_Item_Number,
    lifnr as Vendor_account_number,
    spras as Language_Key,
    waers as Currency_Key    
}