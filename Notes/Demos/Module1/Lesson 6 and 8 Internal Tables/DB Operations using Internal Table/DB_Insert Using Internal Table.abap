REPORT Z.

DATA ITDEPT TYPE TABLE OF Z104329DEPT.
DATA WA TYPE Z104329DEPT.

WA-DEPTNO =  10. WA-DNAME =  'ACCOUNTING'.
WA-LOC =  'NEW YORK'. APPEND WA TO ITDEPT.

WA-DEPTNO = 20. WA-DNAME =   'RESEARCH'.
WA-LOC =   'DALLAS'. APPEND WA TO ITDEPT.

WA-DEPTNO = 30. WA-DNAME =   'SALES'.
WA-LOC = 'CHICAGO'. APPEND WA TO ITDEPT.

WA-DEPTNO = 40. WA-DNAME =   'OPERATIONS'.
WA-LOC =  'BOSTON'. APPEND WA TO ITDEPT.


INSERT Z104329DEPT FROM TABLE ITDEPT.
WRITE SY-SUBRC.
WRITE SY-DBCNT.