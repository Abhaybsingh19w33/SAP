// ===================== ========================================
// Here field JOB,COMM is not part of the join .Still  the fieldS can be written in fetch logic in SE38 program because of association
// _EMP is the name of association as well as the name of the second table
// ===============================================

@AbapCatalog.sqlViewName           : 'ZVSK_CDS1_ASSOC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck  : #CHECK
@EndUserText.label                 : 'CDS With Association'
define view ZVK_CDS1_ASSOC as 
    select from z104329dept as D 
    Association[1.. * ] to z104329emp as _EMP 
        on D.deptno = _EMP.deptno 
    {
        key _EMP.empno, 
        _EMP.ename, 
        D.deptno, 
        D.dname, 
        _EMP // Make association public
    }

// ====================SE38 PROGRAM==============

// 1)Run it commenting the \_emp-job , _emp-comm
// 2)Run it with \_emp-job , _emp-comm

REPORT z.
select empno,
       ename,
       deptno,
       dname,
       \_emp-job,
        \_emp-comm
 from ZVK_CDS1_ASSOC        //Here the VIEW is the view used in
			 // define view ZVK_CDS1_ASSOC
into TABLE @data(it_res).

cl_demo_output=>display( it_res ).