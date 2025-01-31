// First create the  basic view
// ==================
@AbapCatalog.sqlViewName           : 'ZVSK_CDS2_EMP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck  : #CHECK
@EndUserText.label                 : 'Base CDS View'
define view ZVK_CDS2_EMP as
    select from z104329emp {
        empno,
        ename,
        sal,
        deptno
    }

// ===========Extend the basic view ==================================

@AbapCatalog.sqlViewAppendName: 'ZVSK_EX1_VIEW'
@EndUserText.label            : 'Extension view'
extend view ZVK_CDS2_EMP with ZVK_EX2_VIEW {
    JOB, MGR, HIREDATE
}