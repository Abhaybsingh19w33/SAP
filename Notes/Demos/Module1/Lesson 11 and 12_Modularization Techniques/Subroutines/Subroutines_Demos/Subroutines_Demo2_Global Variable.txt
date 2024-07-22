REPORT Z.
* a and b are global variables
DATA: a TYPE i value 10,
      b TYPE i value 20. 

PERFORM sub.

FORM sub.
  a = 11.
  b = 22.
ENDFORM.  