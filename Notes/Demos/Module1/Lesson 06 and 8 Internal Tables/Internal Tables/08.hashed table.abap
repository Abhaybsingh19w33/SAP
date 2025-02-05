*&---------------------------------------------------------------------*
*& Report ZRT_IT_DEMO6
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZRT_IT_DEMO6.


types : begin of ty_stud,
        rollno type i,
        name(10) type c,
   end of ty_stud.

data: stud1 type hashed table of ty_stud
             WITH UNIQUE key rollno.
data: wa1 type  ty_stud. "recommended
*OR
*data: wa1 like line of stud1.

PERFORM addstud1.
*PERFORM dispstud1.
PERFORM disprec.


FORM disprec.
   READ TABLE stud1 into wa1 with KEY rollno = 10.
*READ TABLE stud1 into wa1 index 2.
   "Hashed table cannot be read using index
      WRITE : / sy-tabix , wa1-ROLLNO , wa1-NAME.
ENDFORM.


FORM addstud1.
   wa1-rollno = 10. wa1-name = 'AAA'.
   insert wa1 into table stud1.
   wa1-rollno = 20. wa1-name = 'BBB'.
   insert wa1 into table stud1.
   wa1-rollno = 30. wa1-name = 'CCc'.
   insert wa1 into table stud1.
   wa1-rollno = 30. wa1-name = 'DDD'.
   "Duplicate Entry is ignored
   insert wa1 into table stud1.

   *wa1-rollno = 25. wa1-name = 'ABC'.
   *insert  wa1 into stud1 index 4.
endform.



form dispstud1.
   LOOP AT STUD1 into wa1.
      WRITE : / sy-tabix , wa1-ROLLNO , wa1-NAME.
   ENDLOOP.
ENDFORM.