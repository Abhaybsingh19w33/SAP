REPORT z.

data itdept type table of z104329dept.
data wa type z104329dept.

wa-deptno =  10. wa-dname =  'ACCOUNTING'.
wa-loc =  'NEW YORK'. APPEND wa to itdept.

wa-deptno = 20. wa-dname =   'RESEARCH'.
wa-loc =   'DALLAS'. APPEND wa to itdept.

wa-deptno = 30. wa-dname =   'SALES'.
wa-loc = 'CHICAGO'. APPEND wa to itdept.

wa-deptno = 40. wa-dname =   'OPERATIONS'.
wa-loc =  'BOSTON'. APPEND wa to itdept.


INSERT z104329dept from TABLE itdept.
INSERT z104329dept from wa. "will insert one record