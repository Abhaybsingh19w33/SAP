REPORT  Z.
DATA ITSCARR TYPE  TABLE OF SCARR.
"Internal table doesn't have a header line
"Header line is NOT automatically created in subroutine
SELECT * FROM SCARR UP TO 5 ROWS INTO TABLE ITSCARR.
WRITE:/ 'Before invoking subroutine S1:'.
PERFORM DISPITSCARR.
PERFORM  S1 USING ITSCARR.
SKIP 2.
WRITE:/ 'After invoking subroutine S1:'.
PERFORM DISPITSCARR.

FORM S1 USING VALUE(PT) LIKE ITSCARR.  "pass by value
*Header line is NOT automatically created in subroutine
  DATA WASCARR TYPE SCARR.
*In the above case the work area name is WASCARR'.
  MODIFY PT FROM WASCARR INDEX 3.
ENDFORM.

FORM DISPITSCARR.
DATA WASCARR1 TYPE SCARR.
LOOP AT ITSCARR INTO WASCARR1.
    WRITE / WASCARR1-CARRID.
ENDLOOP.
ENDFORM.