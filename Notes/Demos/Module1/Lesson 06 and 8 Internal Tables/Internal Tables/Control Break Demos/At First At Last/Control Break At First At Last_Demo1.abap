REPORT Z104329PGM1 NO STANDARD PAGE HEADING.

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

SELECT CARRID CONNID FLDATE PLANETYPE SEATSMAX SEATSOCC UP TO 4 ROWS
    FROM SFLIGHT
  INTO TABLE ITSFLIGHT.

LOOP AT ITSFLIGHT INTO WA.

  AT FIRST.
    FORMAT COLOR 5.
    WRITE: /  'Carrid',
            12 'Connid',
            25 'Flightdate',
            45 'Plane Type',
            65 'Seats Maximum',
            85 'Seats Occupied'.
    FORMAT COLOR OFF.
    ULINE.
  ENDAT.
  WRITE : / WA-CARRID ,
           12 WA-CONNID,
           25 WA-FLDATE,
           45 WA-PLANETYPE,
           65 WA-SEATSMAX,
           85 WA-SEATSOCC.
  AT LAST.
    WRITE: /  '--------',
           12 '------',
           25 '----------',
           45 '---------',
           70 '-----',
           90 '-----'.
  ENDAT.

ENDLOOP.