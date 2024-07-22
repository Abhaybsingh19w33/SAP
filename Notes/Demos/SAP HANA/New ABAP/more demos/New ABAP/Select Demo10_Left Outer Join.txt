Join the columns carrid, carrname, and connid of the database tables scarr and spfli using a left outer join. For all flights that do not depart from p_cityfr, the column connid is set to the null value that was transformed to the initial value for its type (when passed to the associated data object). All the airlines that do not fly from p_cityfr are displayed. 

PARAMETERS p_cityfr TYPE spfli-cityfrom. 

TYPES: BEGIN OF wa, 
         carrid   TYPE scarr-carrid, 
         carrname TYPE scarr-carrname, 
         connid   TYPE spfli-connid, 
      END OF wa. 
DATA  itab TYPE SORTED TABLE OF wa 
                WITH NON-UNIQUE KEY carrid. 

SELECT s~carrid, s~carrname, p~connid 
       FROM scarr AS s 
       LEFT OUTER JOIN spfli AS p ON s~carrid   =  p~carrid 
                                  AND p~cityfrom = @p_cityfr 
       INTO CORRESPONDING FIELDS OF TABLE @itab. 

DELETE itab WHERE connid <> '0000'. 

cl_demo_output=>display( itab ). 

