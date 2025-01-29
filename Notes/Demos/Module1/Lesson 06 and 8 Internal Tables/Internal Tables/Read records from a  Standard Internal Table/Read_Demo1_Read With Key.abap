REPORT Z104329PGM1 NO STANDARD PAGE HEADING.
TYPES : BEGIN OF TY_SCARR,
          CARRID   TYPE SCARR-CARRID,
          CARRNAME TYPE SCARR-CARRNAME,
          CURRCODE TYPE SCARR-CURRCODE,
        END OF TY_SCARR.

DATA ITSCARR TYPE TABLE OF TY_SCARR.
DATA WA TYPE TY_SCARR.

PERFORM SELECTFROMDB.
IF SY-SUBRC = 0.
  PERFORM READWITHKEY.
ELSE.
  WRITE 'Select not successful'.
ENDIF.

FORM SELECTFROMDB.
  SELECT CARRID
         CARRNAME
         CURRCODE
         UP TO 10 ROWS
         FROM SCARR
         INTO TABLE ITSCARR.
ENDFORM.

FORM READWITHKEY.
* All fields of the specific record
* are transported from internal table
* to work area
* Transporting All fields is the default

  READ TABLE ITSCARR "TRANSPORTING ALL FIELDS
  INTO WA WITH
  "KEY CARRID = 'AA'.
  " KEY CURRCODE = 'USD'. "First occurence of USD
   KEY CARRID = 'AA' CARRNAME = 'American Airlines'.
  "Above implies AND
  WRITE: 'SY-SUBRC IS :' , SY-SUBRC.
  IF SY-SUBRC = 0.
    PERFORM DISP.
  ELSE.
    WRITE 'Record not present'.
  ENDIF.
ENDFORM.

FORM DISP.
  WRITE: /'Carrid is' , WA-CARRID,
          'Carrname is',WA-CARRNAME,
          'Currcode is',WA-CURRCODE.
  SKIP.
ENDFORM.