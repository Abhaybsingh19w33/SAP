REPORT  ZVKCOPYTAB.

DATA : ITDEPT TYPE TABLE OF
      Z104329DEPT.
DATA : WADEPT TYPE Z104329DEPT.

PERFORM DELETEDB.
PERFORM UPDATEDB.
PERFORM MODIFYDB.

FORM DELETEDB.
DELETE FROM Z104329DEPT WHERE DEPTNO = 88.
WRITE SY-SUBRC.

ENDFORM.
FORM UPDATEDB.
UPDATE Z104329DEPT SET DNAME = 'aa' LOC = 'ZZZ'
WHERE DEPTNO = 99.


WRITE SY-SUBRC.

ENDFORM.

FORM MODIFYDB.
    WADEPT-DEPTNO = 88.
    WADEPT-DNAME = '85'.
    WADEPT-LOC = '85'.
    
  MODIFY Z104329DEPT FROM WADEPT. 
    
* If the record 88 is not present in DB it is addded to the DB
* If the record 88 is present in DB it is modified in the DB    
ENDFORM.  