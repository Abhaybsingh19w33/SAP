REPORT Z149_INTERNALTAB_PR1.

data itab1 type TABLE OF i WITH HEADER LINE.  "workarea is already created.
*data itab2 type TABLE OF i. "without header line. wa needs to be exclusively created.
data wa type i.
PERFORM addtointtab1.
PERFORM dispinttab1.
*PERFORM addtointtab2.
*PERFORM dispinttab2.


FORM addtointtab1.
itab1 = 10. APPEND itab1 to itab1.
itab1 = 20. APPEND itab1 to itab1.
itab1 = 30. APPEND itab1 to itab1.
itab1 = 40. APPEND itab1 to itab1.
itab1 = 50. APPEND itab1 to itab1.
ENDFORM.

FORM dispinttab1.
  LOOP at itab1 into itab1.  
    WRITE : / sy-tabix, itab1. 
  ENDLOOP.
  WRITE : / 'sy-subrc', sy-subrc.

ENDFORM.

*FORM addtointtab2.
*wa = 10. APPEND wa to itab2.
*wa = 20. APPEND wa to itab2.
*wa = 30. APPEND wa to itab2.
*wa = 40. APPEND wa to itab2.
*wa = 50. APPEND wa to itab2.
*ENDFORM.
*
*FORM dispinttab2.
*  LOOP at itab2 into wa.
*    WRITE : / sy-tabix, wa.
*  ENDLOOP.
*
*ENDFORM.