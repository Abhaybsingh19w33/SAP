REPORT Z.
* Can either display with cl_demo_output
* OR
* Declare wa and display using loop endloop

DATA DESTINATIONS TYPE TABLE OF SPFLI-CITYTO.
DATA WA TYPE SPFLI-CITYTO.

SELECT DISTINCT CITYTO
       FROM SPFLI
       WHERE CARRID = 'LH' AND
             CITYFROM = 'FRANKFURT'
       INTO TABLE @DESTINATIONS.

cl_demo_output=>display_data( destinations ).

LOOP AT DESTINATIONS INTO WA.
  WRITE WA.
ENDLOOP.