REPORT  ZVKCALLINGPGM.

INITIALIZATION.
DATA: p1  TYPE i VALUE 5,
      p2  TYPE i VALUE 5,
      res TYPE i value 0.

WRITE:/ 'BEFORE CALLING PGM RES', RES.

SUBMIT ZVKCALLEDPGM
WITH  p1 EQ 40
WITH  p2 EQ 50
VIA SELECTION-SCREEN
AND RETURN.

WRITE:/ 'AFTER CALLING PGM RES' , res.

*__________________________________

REPORT  ZVKCALLEDPGM.
PARAMETERS: p1  TYPE i,
            p2  TYPE i,
            ans TYPE i.

ans = p1  + p2.
write : / 'IN CALLED ans:', ans.