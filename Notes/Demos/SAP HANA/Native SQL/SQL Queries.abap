" Queries for ADBC

" In this case all tables 
" z104329emp
" zRole1
" z104329Role2
" z104329dept
" are created in DDIC.

" It could also have been created in the Modeler perspective

" These queries are executed in the modeler perspective

" 1) Fetch query

SELECT * FROM SAPHANADB.z104329emp;

SELECT EMPNO ,EMPNAME, DEPTNO, 'I' as Emptype
 FROM SAPHANADB.z104329emp;

" 3)JOIN

select 
	E.EMPNO,
        E.EMPNAME,
        E.SAL,
        E.DEPTNO,
        D.DNAME,
        D.LOC
from SAPHANADB.Z104329EMP E 
inner join
SAPHANADB.Z104329DEPT D 
on E.DEPTNO = D.DEPTNO; 


select 
	E.EMPNO,
        E.EMPNAME,
        E.SAL,
        E.DEPTNO,
        D.DNAME,
        D.LOC
from SAPHANADB.Z104329EMP E 
left outer join
SAPHANADB.Z104329DEPT D 
on E.DEPTNO = D.DEPTNO; 
 
 
select 
	E.EMPNO,
        E.EMPNAME,
        E.SAL,
        E.DEPTNO,
        D.DNAME,
        D.LOC
from SAPHANADB.Z104329EMP E 
right outer join
SAPHANADB.Z104329DEPT D 
on E.DEPTNO = D.DEPTNO; 
 

" ================================
" 3)Case and endcase
select 
	E.EMPNO,
        E.EMPNAME,
        E.SAL,
        E.DEPTNO,
        E.SAL,
        D.DNAME,
        D.LOC,
        case 
                when E.SAL between 1 and 1500 then 'LOW'
                when E.SAL between 1501 and 3000 then 'MEDIUM'
                when E.SAL > 3000 then 'HIGH'        
                else 'NA'
        end as grade        
from SAPHANADB.Z104329EMP E 
inner join
SAPHANADB.Z104329DEPT D 
on E.DEPTNO = D.DEPTNO; 

" 4) Group by
select 
        Sum(Sal)
        Deptno
from SAPHANADB.Z104329EMP 
group by Deptno; 

" 4) Having

select 
        Sum(Sal)
        Deptno
from SAPHANADB.Z104329EMP 
group by Deptno
having sum(Sal) > 10000;

" 2) UNION
select * from SAPHANADB.zRole1
union
select * from SAPHANADB.zRole2

" ============================================================

select * from SAPHANADB.zRole1
union all
select * from SAPHANADB.zRole2

select * from SAPHANADB.z104329emp where sal > (select sal from SAPHANADB.z104329emp where EMPNAME = 'SMITH')

create view zvkview as 
        select 
                E.EMPNO,
                E.EMPNAME,
                E.SAL,
                E.DEPTNO,
                D.DNAME,
                D.LOC,
                case 
                        when E.SAL between 1 and 1500 then 'LOW'
                        when E.SAL between 1501 and 3000 then 'MEDIUM'
                        when E.SAL > 3000 then 'HIGH'
                        else 'NA'
                end as grade        
        from SAPHANADB.Z104329EMP E 
        inner join
        SAPHANADB.Z104329DEPT D 
        on E.DEPTNO = D.DEPTNO; 

select * from zvkview;