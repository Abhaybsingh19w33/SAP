REPORT Z.
"Begin of Line lets all parameters
*appear on the same line
*When all parameters appear on same line we cannot
*see parameter labels
*Hence, need to give COMMENT
*comments can be given only
*in begin of line end of line else we get runtime error

SELECTION-SCREEN BEGIN OF LINE.
"SELECTION-SCREEN COMMENT 4(15) 'Enter Full Name:'.
"cannot  hard code like above
SELECTION-SCREEN COMMENT 4(15) COMM1.

PARAMETERS: FNAME(7)  TYPE C,
            MNAME(7)  TYPE C,
            LNAME(10) TYPE C.
SELECTION-SCREEN END OF LINE.

INITIALIZATION.
  COMM1 ='Enter Fullname:'.

START-OF-SELECTION.
  WRITE:/  FNAME , MNAME, LNAME.