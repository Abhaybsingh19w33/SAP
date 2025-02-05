REPORT Z.
SELECT *
       FROM SFLIGHT
       INTO TABLE @DATA(SFLIGHT_TAB).

LOOP AT SFLIGHT_TAB INTO DATA(WA)
  GROUP BY WA-CARRID.
  WRITE / WA-CARRID .
ENDLOOP.


REPORT Z.
SELECT *
       FROM SFLIGHT
       INTO TABLE @DATA(SFLIGHT_TAB).

LOOP AT SFLIGHT_TAB INTO DATA(WA)
                  GROUP BY ( Key1 = WA-CARRID Key2 = WA-CONNID ).
  WRITE :/ WA-CARRID, WA-CONNID .
ENDLOOP.

REPORT Z.
DATA FLIGHTS TYPE TABLE OF SPFLI WITH EMPTY KEY.
DATA MEMBERS LIKE FLIGHTS.

SELECT * FROM  SPFLI
         WHERE CARRID = 'AA'
         INTO TABLE @FLIGHTS.

LOOP AT FLIGHTS INTO DATA(FLIGHT)
     GROUP BY ( CARRIER = FLIGHT-CARRID CITYFR = FLIGHT-CITYFROM )
              ASCENDING
              ASSIGNING FIELD-SYMBOL(<GROUP>).
  CLEAR MEMBERS.
  LOOP AT GROUP <GROUP> ASSIGNING FIELD-SYMBOL(<FLIGHT>).
    MEMBERS = VALUE #( BASE MEMBERS ( <FLIGHT> ) ).
  ENDLOOP.
  CL_DEMO_OUTPUT=>WRITE( MEMBERS ).
ENDLOOP.

CL_DEMO_OUTPUT=>DISPLAY( ).