REPORT z.
"In a standard table, key may be given
"Standard table cannot have a unique key
DATA: itemp1 TYPE STANDARD
      TABLE OF z104329emp.
*DATA:  wa1 type z104329emp.
*OR
DATA:  wa1 LIKE LINE OF itemp1.

PERFORM selectdbtab1.
*PERFORM dispall.
*PERFORM readwithindex.
*PERFORM readwithkey.
*PERFORM readwithnonkey.
*PERFORM readwithkey1. "transportingnofields.
*PERFORM readwithkey2. "transportingfewfields.
*PERFORM readcomparing.
*PERFORM sorttab.
* PERFORM modrow.
PERFORM delrow.

FORM selectdbtab1.
  SELECT *  UP TO 10 ROWS
     FROM z104329emp
     INTO TABLE itemp1.
ENDFORM.

FORM dispall.
  LOOP AT itemp1
  INTO wa1.
* FROM 3.
*TO 3.
*FROM 2 TO 5
*    WHERE JOB = 'MANAGER'. "//? and or
*Above 2 are allowed
*Index not allowed in loop
    PERFORM disp.
  ENDLOOP.
ENDFORM.

FORM readwithkey.
  CLEAR wa1.
  READ TABLE itemp1 INTO wa1 WITH
  KEY empno = 7369   "?? OR
  "job = 'CLERK'.  "This is empno = 7369 and Job = 'Clerk'
  job = 'ANALYST'. "This is empno = 7369 and Job = 'ANALYST'
  WRITE: 'SY-SUBRC IS :' , sy-subrc.
  IF sy-subrc = 0.
    PERFORM disp.
  ENDIF.
ENDFORM.

FORM readwithnonkey.
  CLEAR wa1.
  READ TABLE itemp1 INTO wa1 WITH
  KEY sal = 5000.
  WRITE: 'SY-SUBRC IS :' , sy-subrc.
  IF sy-subrc = 0.
    PERFORM disp.
  ENDIF.
ENDFORM.

FORM readwithkey1. " transportingnofields.
  CLEAR wa1.
  READ TABLE itemp1 INTO wa1 WITH
  KEY empno = 7369 TRANSPORTING NO FIELDS.
  WRITE: 'SY-SUBRC IS :' , sy-subrc.
  IF sy-subrc = 0.
    PERFORM disp.
  ENDIF.
ENDFORM.

FORM readwithkey2. " transportingfewfields.
  CLEAR wa1.
  READ TABLE itemp1 INTO wa1 WITH
  KEY empno = 7369  TRANSPORTING empno hiredate.
  WRITE: 'SY-SUBRC IS :' , sy-subrc.
  IF sy-subrc = 0.
    PERFORM disp.
  ENDIF.
ENDFORM.

FORM readwithindex.
  READ TABLE itemp1 INTO wa1 INDEX 4.
  WRITE: 'SY-SUBRC IS :' , sy-subrc.
  IF sy-subrc = 0.
    PERFORM disp.
  ENDIF.
ENDFORM.

FORM disp.
  WRITE:/ wa1-empno,wa1-ename,wa1-job,wa1-mgr,
  wa1-hiredate,wa1-sal,
  wa1-comm,wa1-deptno.
ENDFORM.


FORM  modrow.
  CLEAR wa1.
  wa1-empno = 9999.
  wa1-ename = 'New Name'.
  wa1-job = 'New Job'.
  wa1-sal = 9999.
  wa1-hiredate = '20991231'.
  wa1-comm = 99.
  wa1-deptno = 99.

*MODIFY itemp1 index 4 FROM wa1 . "default transports all fields
  MODIFY itemp1 INDEX 4 FROM wa1
  TRANSPORTING ename hiredate.
  WRITE: 'SY-SUBRC IS :' , sy-subrc.
  CLEAR wa1.
  IF sy-subrc = 0.
    PERFORM dispall.
  ENDIF.
ENDFORM.

FORM delrow.
*DELETE itemp1 from 2.
* DELETE itemp1 to 3. "from 1 to 3
* DELETE itemp1 from 2  to 4.
* DELETE itemp1 index 6.
* DELETE itemp1 WHERE ename = 'SMITH'.
  DELETE itemp1 WHERE
  ename = 'SMITH' OR deptno = 10.
 WRITE: 'SY-SUBRC IS :' , SY-SUBRC.
  IF sy-subrc = 0.
    PERFORM dispall.
  ELSE.
   WRITE: 'Record Not found :' , sy-subrc.
  ENDIF.
ENDFORM.

FORM sorttab.
* sort itemp1 by ename DESCENDING.
  SORT itemp1 BY job ename DESCENDING.
  WRITE: 'SY-SUBRC IS :' , sy-subrc.
  IF sy-subrc = 0.
    PERFORM dispall.
  ENDIF.
ENDFORM.

FORM readcomparing.
  clear wa1.
  wa1-empno = 7369.
  wa1-ename = 'SMITH'.
*wa1-ename = 'JACK'.
*read table itemp1 into wa1 comparing empno ename. "NOT ALLOWED
"read table itemp1 into wa1 index 1 COMPARING ALL FIELDS. "all fields is default
  READ TABLE itemp1 INTO wa1 INDEX 1 COMPARING empno ename.
" READ TABLE itemp1 INTO wa1 with KEY job = 'CLERK' COMPARING empno ename. 
  WRITE: 'SY-SUBRC IS :' , sy-subrc.
  IF sy-subrc = 0.
    PERFORM disp.
  ENDIF.
ENDFORM.