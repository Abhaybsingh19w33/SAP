REPORT z.
Z104329DBVIEW1 is based on a single table.
DATA ITAB TYPE TABLE OF Z104329DBVIEW1.
DATA WA TYPE Z104329DBVIEW1.

 WA-EMPNO = 98.
 WA-ENAME = 'Shyam'.
 WA-SAL = 9898.
*
 INSERT  Z104329DBVIEW2 FROM WA.
 WRITE: 'SY-SUBRC', SY-SUBRC.

Addtion of records possible only if Maintenance status is read and change.