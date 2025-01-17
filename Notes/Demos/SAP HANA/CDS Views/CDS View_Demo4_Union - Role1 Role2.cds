@AbapCatalog.sqlViewName           : 'ZVSK_CDS_UNION'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck  : #CHECK
@EndUserText.label                 : 'CDS With Unions'
define view ZVK_CDS_UNION as
        select from zrole1 {
            empno as Employee_Number,
            role

        }
    union
        select from zrole2 {
            empno as Employee_Number,
            role

        }