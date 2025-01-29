REPORT Z.
"Double Click on Text-001 to enter value in it
"SELECTION-SCREEN BEGIN OF LINE.
"Begin of Line lets all parameters
*appear on the same line
*When all parameters appear on same line we cannot
*see parameter labels
*Hence, need to give COMMENT

SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 4(15) Text-001.
PARAMETERS: FNAME(7)  TYPE C,
            MNAME(7)  TYPE C,
            LNAME(10) TYPE C.
SELECTION-SCREEN END OF LINE.

START-OF-SELECTION.
  WRITE:/  FNAME , MNAME, LNAME.