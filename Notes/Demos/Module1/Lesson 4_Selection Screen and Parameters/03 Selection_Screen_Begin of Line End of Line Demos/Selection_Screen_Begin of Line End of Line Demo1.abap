REPORT Z.
"Begin of Line lets all parameters 
*appear on the same line
*When all parameters appear on same line we cannot 
*see parameter labels

SELECTION-SCREEN BEGIN OF LINE.
PARAMETERS: FNAME(7)  TYPE C,
            MNAME(7)  TYPE C,
            LNAME(10) TYPE C.
SELECTION-SCREEN END OF LINE.

START-OF-SELECTION.
  WRITE:/  FNAME , MNAME, LNAME.