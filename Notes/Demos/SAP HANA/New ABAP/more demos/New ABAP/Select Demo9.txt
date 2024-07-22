REPORT Z.

*Join of the columns carrname, connid, and fldate of the database tables scarr, spfli, and sflight 
*using two inner joins. This creates a list of flights from p_cityfr to p_cityto. 
*An alias name is assigned to each table. 

PARAMETERS: p_cityfr TYPE spfli-cityfrom, 
            p_cityto TYPE spfli-cityto. 

TYPES: BEGIN OF wa, 
         fldate TYPE sflight-fldate, 
         carrname TYPE scarr-carrname, 
         connid   TYPE spfli-connid, 
       END OF wa. 

DATA itab TYPE SORTED TABLE OF wa 
          WITH UNIQUE KEY fldate carrname connid. 

SELECT c~carrname, p~connid, f~fldate 
       FROM ( ( scarr AS c 
         INNER JOIN spfli AS p ON p~carrid   = c~carrid 
                              AND p~cityfrom = @p_cityfr 
                              AND p~cityto   = @p_cityto ) 
         INNER JOIN sflight AS f ON f~carrid = p~carrid 
                                AND f~connid = p~connid ) 
       INTO CORRESPONDING FIELDS OF TABLE @itab. 

cl_demo_output=>display( itab ). 


