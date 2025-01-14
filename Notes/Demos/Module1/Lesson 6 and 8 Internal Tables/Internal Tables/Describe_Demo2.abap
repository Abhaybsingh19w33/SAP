REPORT Z.
TYPES : BEGIN OF IT_TYP ,
          VAR  TYPE I, 
          VAR1 TYPE C,
        END OF IT_TYP.

DATA IT TYPE STANDARD TABLE OF IT_TYP INITIAL SIZE 6.
DATA WA TYPE IT_TYP .

IF IT[] IS INITIAL.
  WRITE:  / 'IT table is empty'.
ENDIF.
APPEND: WA TO IT,
        WA TO IT,
        WA TO IT. "same as appending 3 times
IF  NOT IT[] IS INITIAL.
  WRITE: / 'IT table is not empty'. "output is : it is not empty
ENDIF.

WRITE: / 'Display contents'.
LOOP AT IT INTO WA.
  WRITE:/ 'WA is:', WA-VAR1.
ENDLOOP.

WRITE: / 'number of rows from sy-tabix:', SY-TABIX.  "output is 3
DESCRIBE TABLE IT.
WRITE: / 'number of rows from sy-tfill:', SY-TFILL,  "output is 3
      / 'occurs value from sy-toccu:',  SY-TOCCU, " output 6
     / 'length of a row from sy-leng:', SY-TLENG.  
