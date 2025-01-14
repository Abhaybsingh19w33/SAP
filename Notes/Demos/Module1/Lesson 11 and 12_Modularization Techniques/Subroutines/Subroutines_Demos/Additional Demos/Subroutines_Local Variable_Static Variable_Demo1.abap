REPORT  Z.
PERFORM PARA1.
"WRITE: / LVAR1.
"WRITE: / SVAR1.
"lvar1 svar1 will not be available here
PERFORM PARA1.

FORM PARA1.
  DATA LVAR1  TYPE I VALUE 10.
  "value will be reinitialized every time in subroutine
  STATICS SVAR1  TYPE I VALUE 10.
  "statics value will NOT be reinitialized every time in subroutine
  LVAR1 = LVAR1 + 1.
  SVAR1 = SVAR1 + 1.
  WRITE: /'lvar1 is:',LVAR1. "11 11
  WRITE:  'svar1 is:',SVAR1. "11 12
ENDFORM.
