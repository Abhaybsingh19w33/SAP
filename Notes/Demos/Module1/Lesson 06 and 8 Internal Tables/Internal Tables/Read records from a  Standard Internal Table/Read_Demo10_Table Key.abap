REPORT Z104329PGM1 NO STANDARD PAGE HEADING.
TYPES: BEGIN OF FLIGHTTYPE,
         FLDATE    TYPE SFLIGHT-FLDATE,
         PLANETYPE TYPE SFLIGHT-PLANETYPE,
         CARRID    TYPE SFLIGHT-CARRID,
         CONNID    TYPE SFLIGHT-CONNID,
         SEATSMAX  TYPE SFLIGHT-SEATSMAX,
         SEATSOCC  TYPE SFLIGHT-SEATSOCC,
       END OF   FLIGHTTYPE.
DATA: ITSFLIGHT TYPE STANDARD TABLE OF FLIGHTTYPE INITIAL SIZE 0 
      WITH NON-UNIQUE KEY CARRID CONNID,
      WA        TYPE  FLIGHTTYPE.

WA-CARRID = 'AA'. WA-CONNID = '17'. WA-FLDATE = '20190731'. WA-PLANETYPE = '747-400'. WA-SEATSMAX = 385. WA-SEATSOCC = 375.
APPEND WA TO ITSFLIGHT.

WA-CARRID = 'AZ'. WA-CONNID = '64'. WA-FLDATE = '20190827'. WA-PLANETYPE = 'DC-10-10'. WA-SEATSMAX = 380. WA-SEATSOCC = 367.
APPEND WA TO ITSFLIGHT.

WA-CARRID = 'DL'. WA-CONNID = '17'. WA-FLDATE = '20190923'. WA-PLANETYPE = 'A310-300'. WA-SEATSMAX = 280. WA-SEATSOCC = 271.
APPEND WA TO ITSFLIGHT.

WA-CARRID = 'AZ'. WA-CONNID = '64'. WA-FLDATE = '20190731'. WA-PLANETYPE = 'A319'. WA-SEATSMAX = 220. WA-SEATSOCC = 211.
APPEND WA TO ITSFLIGHT.

WA-CARRID = 'AA'. WA-CONNID = '17'. WA-FLDATE = '20190830'. WA-PLANETYPE = 'A310-300'. WA-SEATSMAX = 280. WA-SEATSOCC = 261.
APPEND WA TO ITSFLIGHT.

WA-CARRID = 'DL'. WA-CONNID = '64'. WA-FLDATE = '20190923'. WA-PLANETYPE = 'A319'. WA-SEATSMAX = 220. WA-SEATSOCC = 213.
APPEND WA TO ITSFLIGHT.

WA-CARRID = 'AA'. WA-CONNID = '64'. WA-FLDATE = '20190828'. WA-PLANETYPE = '747-400'.  WA-SEATSMAX = 385. WA-SEATSOCC = 371.
APPEND WA TO ITSFLIGHT.

WA-CARRID = 'AZ'. WA-CONNID = '17'. WA-FLDATE = '20190828'. WA-PLANETYPE = 'A319'. WA-SEATSMAX = 220. WA-SEATSOCC = 205.
APPEND WA TO ITSFLIGHT.

WA-CARRID = 'AA'. WA-CONNID = '64'. WA-FLDATE = '20190802'. WA-PLANETYPE = 'A310-300'. WA-SEATSMAX = 280. WA-SEATSOCC = 271.
APPEND WA TO ITSFLIGHT.

WA-CARRID = 'AZ'. WA-CONNID = '17'. WA-FLDATE = '20190924'. WA-PLANETYPE = 'DC-10-10'. WA-SEATSMAX = 380. WA-SEATSOCC = 370.
APPEND WA TO ITSFLIGHT.

WA-CARRID = 'DL'. WA-CONNID = '17'. WA-FLDATE = '20190826'. WA-PLANETYPE = 'A310-300'. WA-SEATSMAX = 280. WA-SEATSOCC = 270.
APPEND WA TO ITSFLIGHT.

WA-CARRID = 'AZ'. WA-CONNID = '64'. WA-FLDATE = '20190802'. WA-PLANETYPE = 'DC-10-10'. WA-SEATSMAX = 380. WA-SEATSOCC = 361.
APPEND WA TO ITSFLIGHT.

WA-CARRID = 'DL'. WA-CONNID = '64'. WA-FLDATE = '20190826'. WA-PLANETYPE = 'A319'. WA-SEATSMAX = 220. WA-SEATSOCC = 213.
APPEND WA TO ITSFLIGHT.

WA-CARRID = 'AZ'. WA-CONNID = '64'. WA-FLDATE = '20190828'. WA-PLANETYPE = 'A310-300'. WA-SEATSMAX = 380. WA-SEATSOCC = 361.
APPEND WA TO ITSFLIGHT.

PERFORM DISPALL.
SKIP 2.

READ TABLE ITSFLIGHT INTO WA WITH TABLE KEY CARRID = 'AA' CONNID = '17'.
"Above works

IF SY-SUBRC = 0.
  PERFORM DISP.
ENDIF.

FORM DISPALL.
LOOP AT ITSFLIGHT INTO WA.
  WRITE : / WA-CARRID ,
          12 WA-CONNID,
          25 WA-FLDATE,
          45 WA-PLANETYPE,
          65 WA-SEATSMAX,
          85 WA-SEATSOCC.
 ENDLOOP.
ENDFORM.

FORM DISP.
  WRITE : / WA-CARRID ,
          12 WA-CONNID,
          25 WA-FLDATE,
          45 WA-PLANETYPE,
          65 WA-SEATSMAX,
          85 WA-SEATSOCC.
ENDFORM.