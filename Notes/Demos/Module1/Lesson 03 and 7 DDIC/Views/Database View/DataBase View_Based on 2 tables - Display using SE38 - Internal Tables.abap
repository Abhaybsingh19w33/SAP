REPORT Z.
DATA ITEMPDEPT TYPE STANDARD TABLE OF Z104329DBVIEW1.
DATA WAEMPDEPT TYPE Z104329DBVIEW1.

SELECT MANDT DEPT_DEPTNO DNAME LOC EMPNO ENAME SAL EMP_DEPTNO
  INTO TABLE ITEMPDEPT
  FROM Z104329DBVIEW1.

LOOP AT ITEMPDEPT INTO WAEMPDEPT.
  WRITE : / WAEMPDEPT-EMPNO,
            WAEMPDEPT-ENAME,
            WAEMPDEPT-SAL,
            WAEMPDEPT-EMP_DEPTNO,
            WAEMPDEPT-DEPT_DEPTNO,
            WAEMPDEPT-DNAME,
            WAEMPDEPT-LOC.
ENDLOOP.