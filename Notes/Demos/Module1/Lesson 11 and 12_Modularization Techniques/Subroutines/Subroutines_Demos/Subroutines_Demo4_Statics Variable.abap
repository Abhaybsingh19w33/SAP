REPORT  Z.
PERFORM PARA1.
PERFORM PARA1.
"WRITE: / 'lvar1 is:',LVAR1.
"lvar1 will not be available here

FORM PARA1.
  STATICS LVAR1  TYPE I VALUE 10.
  LVAR1 = LVAR1  + 1.
  WRITE: / 'lvar1 is:',LVAR1.

  PERFORM PARA2.
ENDFORM.

FORM PARA2.
"  WRITE: / 'lvar1 is:',LVAR1.
"lvar1 will not be available here
ENDFORM.

*&---------------------------------------------------------------------*
*& Report  ZRTC_SUBROUTINES1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZRTC_SUBROUTINES2_STATIC.
DATA GVAR1  TYPE I VALUE 10.

PERFORM display.

write :/ '***********&&&&&&&&&&********'.
"WRITE: / LVAR1.
"WRITE: / SVAR1.
"lvar1 svar1 will not be available here
PERFORM display.

FORM display.
  DATA LVAR1  TYPE I VALUE 10.
  "value will be reinitialized every time in subroutine
  STATICS SVAR1  TYPE I VALUE 10.
  "statics value will NOT be reinitialized every time in subroutine
  LVAR1 = LVAR1 + 1.
  SVAR1 = SVAR1 + 1.
  GVAR1 = GVAR1 + 1.
  WRITE: /'lvar1 is:',LVAR1. "11 11
  WRITE: / 'svar1 is:',SVAR1. "11 12
  WRITE:  /'gvar1 is:',gVAR1. "11 12
ENDFORM.


*====================
*report z.
*DO 4 TIMES.
*  PERFORM ADD_ONE.
*ENDDO.
*
*FORM ADD_ONE.
*  DATA    LVAR1 TYPE I VALUE 10.
*  STATICS SVAR1 TYPE I VALUE 10.
*  LVAR1 = LVAR1 + 1. "will be 11 always
*  SVAR1 = SVAR1 + 1. "11 12 13 14
*  WRITE: / LVAR1, SVAR1.
*ENDFORM.