* Any one modify statement may be executed at a time
* Participants must comment remaining lines and uncomment one delete line
REPORT Z104329PGM1 NO STANDARD PAGE HEADING.
TYPES: BEGIN OF TY_SCARR,
         CARRID   TYPE SCARR-CARRID,
         CARRNAME TYPE SCARR-CARRNAME,
         CURRCODE TYPE SCARR-CURRCODE,
       END OF TY_SCARR.

DATA ITSCARR TYPE TABLE OF TY_SCARR.
DATA WA TYPE TY_SCARR.

PERFORM SELECTFROMDB.
IF SY-SUBRC = 0.
  PERFORM DISP.
ELSE.
  WRITE 'Select not successful'.
ENDIF.
SKIP 3.
PERFORM MODROW.

FORM SELECTFROMDB.
  SELECT CARRID
         CARRNAME
         CURRCODE
         UP TO 10 ROWS
         FROM SCARR
         INTO TABLE ITSCARR.
ENDFORM.

FORM  MODROW.
  CLEAR WA.
  WA-CARRID = 'QA'.
  WA-CARRNAME = 'Qatar Airways'.
  WA-CURRCODE = 'AED'.
  " MODIFY ITSCARR INDEX 4 FROM WA . "Implies ITSCARR-CARRID = WA-CARRID. Similary for carrname and currcode
  "  MODIFY ITSCARR INDEX 4 FROM WA TRANSPORTING CARRNAME. "Implies ITSCARR-CARRNAME = WA-CARRNAME. NOT other fields
  " MODIFY ITSCARR FROM WA TRANSPORTING CARRNAME WHERE CARRID = 'AA'.  "Implies ITSCARR-CARRNAME = WA-CARRNAME. NOT other fields
  MODIFY ITSCARR FROM WA TRANSPORTING CARRNAME WHERE CURRCODE = 'USD'."Implies ITSCARR-CARRNAME = WA-CARRNAME. NOT other fields
  "MODIFY ITSCARR FROM WA WHERE CURRCODE = 'USD' ."Implies ITSCARR-CARRNAME = WA-CARRNAME. NOT other fields
*Above does not work

  WRITE: 'SY-SUBRC IS :' , SY-SUBRC.
  IF SY-SUBRC = 0.
    PERFORM DISP.
  ELSE.
    WRITE: 'Record(s) not modified :'.
  ENDIF.
ENDFORM.

FORM DISP.
  LOOP AT ITSCARR INTO WA.
    WRITE: /'Carrid is' , WA-CARRID,
            'Carrname is',WA-CARRNAME,
            'Currcode is',WA-CURRCODE.
  ENDLOOP.
ENDFORM.