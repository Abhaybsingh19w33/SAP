REPORT Z.
TYPES : BEGIN OF IT_TYP ,
          VAR(4) TYPE C,
        END OF IT_TYP.
DATA I TYPE I.
DATA J TYPE I.

DATA IT TYPE STANDARD TABLE OF IT_TYP INITIAL SIZE 6.
DATA WA TYPE IT_TYP .

IF IT[] IS INITIAL.
  WRITE:  / 'it is empty'.
ENDIF.
APPEND: WA TO IT,
        WA TO IT,
        WA TO IT. "same as appending 3 times
IF  NOT IT[] IS INITIAL.
  WRITE: / 'it is not empty'. "output is : itcribe is not empty
ENDIF.
WRITE: / 'number of rows from sy-tabix:', SY-TABIX.  "output is 3

DESCRIBE TABLE IT LINES I. "No or rows - sy-tfill
WRITE :/ 'Value of i is :' , I.

DESCRIBE TABLE IT OCCURS J. "Value of occurs , initial size sy-toccu
WRITE :/ 'Value of j is :' , J.

SKIP 3.
DESCRIBE TABLE IT LINES I OCCURS J.
WRITE :/ 'Value of i is :' , I.
WRITE :/ 'Value of j is :' , J.



