REPORT z.
data wa TYPE z104329dept6.

wa-deptno =  10. wa-dname =  'ACCOUNTING'.
wa-loc =  'NEW YORK'. 
INSERT z104329dept6 from wa. "will insert one record

wa-deptno = 20. wa-dname =   'RESEARCH'.
wa-loc =   'DALLAS'. 
INSERT z104329dept6 from wa. "will insert one record

wa-deptno = 30. wa-dname =   'SALES'.
wa-loc = 'CHICAGO'. 
INSERT z104329dept6 from wa. "will insert one record

wa-deptno = 40. wa-dname =   'OPERATIONS'.
wa-loc =  'BOSTON'. 
INSERT z104329dept6 from wa. "will insert one record