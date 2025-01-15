REPORT Z.

*Reads from the database table spfli and assigns the alternative name s. 
*In this case, the prefix s~ after ORDER BY also does not need to be specified, 
*because only one database table is read and the column name carrid is unique. 
*The prefix spfli~ can no longer be used when assigning the alternative name. 

DATA wa TYPE spfli. 

SELECT * 
       FROM spfli AS s 
       ORDER BY s~carrid 
       INTO @wa. 
  cl_demo_output=>write( wa ). 
ENDSELECT. 
cl_demo_output=>display( ). 

