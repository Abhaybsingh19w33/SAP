*&---------------------------------------------------------------------*
*& Report ZRT_IT_DEMO2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrt_it_demo2.


*1)
"begin of with occurs clause creates
*default header line
DATA : BEGIN OF stud1 OCCURS 0,
         rollno   TYPE i,
         name(10) TYPE c,
       END OF stud1.

*2)
"begin of with occurs clause
*creates default header line
DATA : BEGIN OF stud2  OCCURS 0 ,
         rollno   TYPE i,
         name(10) TYPE c,
       END OF stud2.
DATA: wa2 LIKE  stud2.

*3)
TYPES : BEGIN OF ty_stud,
          rollno   TYPE i,
          name(10) TYPE c,
        END OF ty_stud.


DATA: stud3 TYPE STANDARD TABLE OF ty_stud.
DATA: wa3   TYPE  ty_stud. "recommended

PERFORM disp_stud1.
ULINE.SKIP 2.
PERFORM disp_stud2.
ULINE.SKIP 2.
PERFORM disp_stud3.
*------------------------------------------------------


FORM disp_stud1.
  stud1-rollno = 10. stud1-name = 'AAA'.
  APPEND stud1.
  "same as append stud1 to stud1.
  stud1-rollno = 20. stud1-name = 'BBB'.
  APPEND stud1.
  stud1-rollno = 30. stud1-name = 'CCC'.
  APPEND stud1.

  LOOP AT stud1.
    WRITE : / sy-tabix , stud1-rollno , stud1-name.
  ENDLOOP.

ENDFORM.

FORM disp_stud2.
  wa2-rollno = 10. wa2-name = 'AAA'.
  APPEND wa2 TO stud2.

  wa2-rollno = 20. wa2-name = 'BBBB'.
  APPEND wa2 TO stud2.

  wa2-rollno = 30. wa2-name = 'CCCC'.
  APPEND wa2 TO stud2.

  LOOP AT stud2 INTO wa2.
    WRITE : / sy-tabix, wa2-rollno , wa2-name.
  ENDLOOP.

ENDFORM.

FORM disp_stud3.

  wa3-rollno = 10. wa3-name = 'AAA'.
  APPEND wa3 TO stud3.

  wa3-rollno = 20. wa3-name = 'BBB'.
  APPEND wa3 TO stud3.

  wa3-rollno = 30. wa3-name = 'CCC'.
  APPEND wa3 TO stud3.

  LOOP AT stud3 INTO wa3.
    WRITE : / sy-tabix, wa3-rollno , wa3-name.
  ENDLOOP.
ENDFORM.




*-----------------------------------------------------------------



*occurs 0 is key a word in abap used to create memory in body area , when ever we declare occurs 0 the system will allocates 8bytes of memory and it keep incrementing the memory to 8bytes every time.
*
*occucs 1 is a key word in abap used to create memory in body area of an internal table. it allocates memory for one records only, and keep incrementing every time by one record memory.
*
*Mostly preferred one is occurs 1 , in order to reduce the wastage of memory.