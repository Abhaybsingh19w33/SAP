REPORT Z.
DATA ITEMPDEPT TYPE STANDARD TABLE OF Z104329MAINVIEW1.
DATA WAEMPDEPT TYPE Z104329MAINVIEW1.
* Note we cannot select records from the maintainance view
* Error Maintainance view is not defined in ABAP dictionary as 
* table, projection view or database view
SELECT MANDT DEPT_DEPTNO DNAME LOC EMPNO ENAME SAL EMP_DEPTNO
  INTO TABLE ITEMPDEPT
  FROM Z104329MAINVIEW1.

LOOP AT ITEMPDEPT INTO WAEMPDEPT.
  WRITE : / WAEMPDEPT-EMPNO,
            WAEMPDEPT-ENAME,
            WAEMPDEPT-SAL,
            WAEMPDEPT-EMP_DEPTNO,
            WAEMPDEPT-DEPT_DEPTNO,
            WAEMPDEPT-DNAME,
            WAEMPDEPT-LOC.
ENDLOOP.