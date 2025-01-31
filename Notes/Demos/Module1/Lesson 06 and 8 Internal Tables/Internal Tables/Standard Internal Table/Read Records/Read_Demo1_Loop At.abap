TYPES: BEGIN OF TYSCARR,
        MANDT    TYPE SCARR-MANDT,
        CARRID   TYPE SCARR-CARRID,
        CARRNAME TYPE SCARR-CARRNAME,
        CURRCODE TYPE SCARR-CURRCODE,
       END OF TYSCARR.
DATA ITSCARR TYPE TABLE OF TYSCARR.
DATA WA TYPE TYSCARR.

WA-MANDT = SY-MANDT.

WA-CARRID = 'AA'. WA-CARRNAME = 'American Airlines'.
WA-CURRCODE = 'USD'.
APPEND WA TO ITSCARR.

WA-CARRID = 'AB'. WA-CARRNAME = 'Air Berlin'.
WA-CURRCODE = 'EUR'.
APPEND WA TO ITSCARR.

WA-CARRID = 'AC'. WA-CARRNAME = 'Air Canada'.
WA-CURRCODE = 'CAD'.
APPEND WA TO ITSCARR.

WA-CARRID = 'AF'. WA-CARRNAME = 'Air France'.
WA-CURRCODE = 'EUR'.
APPEND WA TO ITSCARR.

LOOP AT ITSCARR
INTO WA
" FROM 3. "CAN GIVE ONLY FROM. From 3rd record to all records
"  TO 5. "CAN GIVE ONLY TO From 1st to 5th Record
"FROM 3 TO 5.  "CAN GIVE FROM AND TO
"WHERE CARRID = 'AA'.
"WHERE CARRID = 'AA' AND CARRNAME = 'American Airlines'.
WHERE CARRID = 'AA' OR CARRNAME = 'Air Berlin'.
     WRITE: /'Carrid is' , WA-CARRID,
          'Carrname is',WA-CARRNAME,
          'Currcode is',WA-CURRCODE.
ENDLOOP.
