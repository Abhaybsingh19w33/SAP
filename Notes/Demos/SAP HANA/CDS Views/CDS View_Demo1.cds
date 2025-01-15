@AbapCatalog.sqlViewName           : 'ZVSK_CDS1_EMP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck  : #CHECK
@EndUserText.label                 : 'CDS View'
define view ZVK_CDS1_EMP as
    select from z104329emp {
        empno,
        ename,
        sal,
        deptno
    }
