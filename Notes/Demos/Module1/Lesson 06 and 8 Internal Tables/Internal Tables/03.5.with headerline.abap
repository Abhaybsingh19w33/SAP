*&---------------------------------------------------------------------*
*& Report ZRT_IT_DEMO1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrt_it_demo1.

DATA itab1 TYPE TABLE OF i WITH HEADER LINE.


DATA itab2 TYPE TABLE OF i. "without header line
DATA wa TYPE i.

PERFORM addtointtab1.
PERFORM dispinttab1.

PERFORM addtointtab2.
PERFORM dispinttab2.


FORM addtointtab1.
  itab1 = 10. APPEND itab1 TO itab1.
  itab1 = 20. APPEND itab1 TO itab1.
  itab1 = 30. APPEND itab1 TO itab1.
  itab1 = 40. APPEND itab1 TO itab1.
  itab1 = 50. APPEND itab1 TO itab1.
ENDFORM.

FORM dispinttab1.
  LOOP AT itab1 INTO itab1.
    WRITE : / sy-tabix, itab1.
  ENDLOOP.

  ULINE.
  SKIP 2.
ENDFORM.


FORM addtointtab2.
  wa = 10. APPEND wa TO itab2.
  wa = 20. APPEND wa TO itab2.
  wa = 30. APPEND wa TO itab2.
  wa = 40. APPEND wa TO itab2.
  wa = 50. APPEND wa TO itab2.
ENDFORM.

FORM dispinttab2.
  LOOP AT itab2 INTO wa.
    WRITE : / sy-tabix, wa.
  ENDLOOP.
ENDFORM.