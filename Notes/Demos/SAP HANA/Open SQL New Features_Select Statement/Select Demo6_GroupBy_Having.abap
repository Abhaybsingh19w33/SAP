REPORT Z.
SELECT DEPTNO,SUM( SAL ) AS SUMSAL
  FROM Z104329EMP
  GROUP BY DEPTNO
  HAVING  SUM( SAL ) > 10000
      INTO TABLE @DATA(LT_RESULT).
CL_DEMO_OUTPUT=>DISPLAY( LT_RESULT ).