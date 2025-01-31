REPORT Z104329PGM2 NO STANDARD PAGE HEADING.
TYPES: BEGIN OF FLIGHTTYPE,
         CARRID    TYPE SFLIGHT-CARRID,
         CONNID    TYPE SFLIGHT-CONNID,
         FLDATE    TYPE SFLIGHT-FLDATE,
         PLANETYPE TYPE SFLIGHT-PLANETYPE,
         SEATSMAX  TYPE SFLIGHT-SEATSMAX,
         SEATSOCC  TYPE SFLIGHT-SEATSOCC,
       END OF   FLIGHTTYPE.
DATA: ITSFLIGHT TYPE STANDARD TABLE OF FLIGHTTYPE INITIAL SIZE 0,
      WA        TYPE  FLIGHTTYPE.

PERFORM SELECTFROMDB.
SORT ITSFLIGHT BY CARRID CONNID.
LOOP AT  ITSFLIGHT  INTO WA.
  AT FIRST.
    PERFORM DISPFIRST.
  ENDAT.
  AT NEW CARRID.
    WRITE : / 'Carrid:', WA-CARRID COLOR 5.
  ENDAT.
  AT NEW CONNID.
    WRITE : / 'Connid:', WA-CONNID COLOR 7.
  ENDAT.

  PERFORM DISPRESTFIELDS.

  AT END OF CONNID.
    SUM.
    ULINE.
    FORMAT COLOR 1.
    WRITE : / 'Connid' ,  WA-CONNID , 65 WA-SEATSMAX, 85 WA-SEATSOCC.
    FORMAT COLOR OFF.
    ULINE.
  ENDAT.

  AT END OF CARRID.
    SUM.
    FORMAT COLOR 3.
    WRITE : / 'Carrid' ,  WA-CARRID  , 65 WA-SEATSMAX, 85 WA-SEATSOCC.
    FORMAT COLOR OFF.
    ULINE.
  ENDAT.

  AT LAST.
    PERFORM DISPLAST.
  ENDAT.
ENDLOOP.
SKIP.

FORM SELECTFROMDB.
  SELECT CARRID CONNID FLDATE PLANETYPE SEATSMAX SEATSOCC UP TO 160 ROWS
      FROM SFLIGHT
    INTO TABLE ITSFLIGHT.
ENDFORM.

FORM DISPFIRST.
  WRITE: /'Carrid',
          12 'Connid',
          25 'Flightdate',
          45 'Plane Type',
          65 'Seats Maximum',
          85 'Seats Occupied'.

  ULINE.
ENDFORM.

FORM DISPRESTFIELDS.
   WRITE: /25 WA-FLDATE,
          45 WA-PLANETYPE,
          65 WA-SEATSMAX,
          85 WA-SEATSOCC.
ENDFORM.

FORM DISPLAST.
  WRITE: /'--------',
          12 '------',
          25 '----------',
          45 '---------'.
ENDFORM.