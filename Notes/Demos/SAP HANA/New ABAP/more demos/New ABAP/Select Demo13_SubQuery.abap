Reads the flight with the most passengers: 

SELECT * 
       FROM sflight 
       WHERE seatsocc = ( SELECT MAX( seatsocc ) 
                                 FROM sflight ) 
       INTO @DATA(wa_sflight). 
ENDSELECT. 

