REPORT  ZVKCALLINGPGM.
INITIALIZATION.
DATA: p1  TYPE i VALUE 5,
      p2  TYPE i VALUE 5,
      res TYPE i value 0.

WRITE:/ 'BEFORE CALL PGM RES', RES.
EXPORT p1 p2 TO  MEMORY ID 'ABC'.

SUBMIT ZVKCALLEDPGM
AND RETURN.

"EXPORT p1 p2 TO  MEMORY ID 'ABC'.
WRITE:/ 'AFTER CALL PGM RES' , res.

" __________________________________________

REPORT  ZVKCALLEDPGM.
DATA: p1  TYPE i,
      p2  TYPE i,
      ans TYPE i.

IMPORT p1 p2 FROM MEMORY ID 'ABC'.

ans = p1  + p2.
write : / 'IN CALLED ZVKTEST2 ans:', ans.