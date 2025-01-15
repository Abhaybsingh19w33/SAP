@AbapCatalog.sqlViewName           : 'ZVSKCDSJOINCASE'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck  : #CHECK
@EndUserText.label                 : 'join'
define view ZVK_CDS_JOIN_CASE as
    select from z104329emp as E
    inner join z104329dept as d
        on E.deptno = d.deptno
    {
        E.empno,
        E.ename,
        E.sal,
        E.deptno,
        d.dname,
        d.loc,
        case
            when
                E.sal between 1 and 1500
            then
                'LOW'
            when
                E.sal between 1501 and 3000
            then
                'MEDIUM'
            when
                E.sal > 3000
            then
                'HIGH'

            else
                'NA'
        end as grade

    }
