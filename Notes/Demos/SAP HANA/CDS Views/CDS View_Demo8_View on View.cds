@AbapCatalog.sqlViewName           : 'ZVSKCDSVIEW'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck  : #CHECK
@EndUserText.label                 : 'Z104329_CDS1_CUST_JOIN'
define view ZVK_CDS_BASE_VIEW as
    select from scarr SC
    left outer join spfli SP
        on SC.carrid = SP.carrid
    {
        SC.carrid,
        SC.carrname,
        SP.countryfr,
        SP.cityfrom
    };

__________________________________________________


@AbapCatalog.sqlViewName           : 'ZVSK1CDSVIEW1'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck  : #CHECK
@EndUserText.label                 : 'z104329_view_on_view'
define view zVK1_view_on_view as
    select from ZVK_CDS_BASE_VIEW as a
    inner join sflight as sf
        on a.carrid = sf.carrid
    {
        a.carrid,
        a.carrname,
        a.countryfr,
        a.cityfrom,
        sf.fldate,
        sf.price
    }