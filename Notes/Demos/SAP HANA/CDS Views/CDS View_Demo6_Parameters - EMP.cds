@AbapCatalog.sqlViewName           : 'ZVSK_CDS_PARA1'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck  : #CHECK
@EndUserText.label                 : 'cds view with input parameters'
define view ZVK_CDS1_EMP with parameters pempno : abap.numc(4), bonus_per : abap.int1 as
    select from z104329emp {
        empno,
        ename,
        sal,
        :bonus_per as bonus_percent,
        sal * DIVISION(
            :bonus_per, 100, 2
        )          as bonus
    }
    where
        empno = :pempno