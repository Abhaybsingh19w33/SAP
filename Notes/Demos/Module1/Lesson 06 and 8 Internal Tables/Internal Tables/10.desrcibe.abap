*&---------------------------------------------------------------------*
*& Report ZRT_IT_DEMO8
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrt_it_demo8.


TYPES : BEGIN OF it_typ ,
          f1(4) TYPE c,
        END OF it_typ.

DATA:  v_lines TYPE i.
DATA:  j TYPE i.

DATA it TYPE STANDARD TABLE OF it_typ INITIAL SIZE 6.
DATA : wa TYPE it_typ .

START-OF-SELECTION.
  IF it[] IS INITIAL.
    WRITE:  / 'it is empty'.
  ENDIF.

  APPEND: wa TO it,
          wa TO it,
          wa TO it. "same as appending 3 times

  IF  NOT it[] IS INITIAL.
    WRITE: / 'it is not empty'. "output is : itcribe is not empty
  ENDIF.

  WRITE: / 'number of rows from sy-tabix:', sy-tabix.  "output is 3
  DESCRIBE TABLE it.

  WRITE: / 'number of rows from sy-tfill:', sy-tfill,  "No.of records in internal table ....so output is :3
         / 'length of a row from sy-leng:', sy-tleng.  "output is :2.... length of the record

  DESCRIBE TABLE it LINES v_lines.  "displays no.of records in it ...so  output is 3
  WRITE :/ 'No.of records in the internal table is :' , v_lines.

  DESCRIBE TABLE it OCCURS j.   "as initial size is set as 6 it will show 6
  WRITE :/ 'Value of j is :' , j.