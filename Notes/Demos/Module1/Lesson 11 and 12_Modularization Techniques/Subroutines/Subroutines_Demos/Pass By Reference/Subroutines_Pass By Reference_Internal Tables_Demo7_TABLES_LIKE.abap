*Passing an Internal Table without Header Line
*and automatically creating a header line in Subroutine
REPORT Z.
TYPES: BEGIN OF TYSCARR,
         CARRID TYPE SCARR-CARRID,
         CARRNAME TYPE SCARR-CARRNAME,
         CURRCODE TYPE SCARR-CURRCODE,
       END OF TYSCARR.
DATA ITSCARR TYPE TABLE OF TYSCARR.
DATA WASCARR TYPE TYSCARR.
"Internal table does not have header line
SELECT CARRID CARRNAME CURRCODE FROM SCARR UP TO 5 ROWS INTO TABLE ITSCARR.
WRITE:/ 'Before invoking subroutine S1:'.
PERFORM DISPITSCARR.

PERFORM S1 TABLES ITSCARR.
SKIP 2.

WRITE:/ 'After invoking subroutine S1:'.
PERFORM DISPITSCARR.

FORM S1 TABLES FITAB LIKE ITSCARR.
*Header line is automatically created in subroutine
  FITAB-CARRID = 99. "FITAB is the header line
  MODIFY FITAB FROM FITAB INDEX 3. "FITAB is the headerline and internal table
ENDFORM.

FORM DISPITSCARR.
  LOOP AT ITSCARR INTO WASCARR.
    WRITE: / WASCARR-CARRID.
  ENDLOOP.
ENDFORM.