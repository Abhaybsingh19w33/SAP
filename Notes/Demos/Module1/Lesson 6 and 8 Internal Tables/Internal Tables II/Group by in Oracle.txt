select count(*) from emp;
select sum(sal) from emp;

select sum(sal) from emp group by deptno;

select sum(sal),deptno from emp ;
above gives error in oracle

select sum(sal),deptno from emp group by deptno;
above works in oracle

select sum(sal),deptno,job from emp group by deptno;
above gives error in oracle

select sum(sal),deptno,job from emp group by deptno,job;
above works in oracle

select sum(sal),sum(comm),deptno from emp group by deptno;

