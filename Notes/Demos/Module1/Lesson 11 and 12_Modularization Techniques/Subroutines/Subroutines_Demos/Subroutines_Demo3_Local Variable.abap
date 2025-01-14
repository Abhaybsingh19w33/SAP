REPORT  Z.
PERFORM PARA1.
PERFORM PARA1.
"WRITE: / 'lvar1 is:',LVAR1.
"lvar1 will not be available here. The above statement when uncommented will show an error.

FORM PARA1.
  DATA    LVAR1  TYPE I VALUE 10.
  LVAR1 = LVAR1  + 1.
  WRITE: / 'lvar1 is:',LVAR1.

  PERFORM PARA2.
ENDFORM.

FORM PARA2.
"WRITE: / 'lvar1 is:',LVAR1.
"lvar1 will not be available here.The above statement when uncommented will show an error.  
ENDFORM.

*&---------------------------------------------------------------------*
*& Report  ZRTC_SUBROUTINES1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZRTC_SUBROUTINES3_GLOBAL.
DATA VAR TYPE STRING VALUE 'Global text'.
WRITE: / 'Before invoking SUBR1:', VAR.
PERFORM SUBR1.
WRITE: / 'After  invoking SUBR1:', VAR.

FORM SUBR1.
  LOCAL VAR.
  VAR = 'Changed Text in subr1'.
  WRITE: / 'In SUBR1,Before invoking SUBR2:', VAR.
  PERFORM SUBR2.
  WRITE: / 'In SUBR1,After  invoking SUBR2:', VAR.
ENDFORM.

FORM SUBR2.
  LOCAL VAR.
  VAR = 'Text in subr2'.
  WRITE: / 'In SUBR2:', VAR.
ENDFORM.

OUTPUT.
" Before invoking SUBR1: Global text

" In SUBR1,Before invoking SUBR2: Changed Text in subr1
" In SUBR2: Text in subr2
" In SUBR1,After  invoking SUBR2: Changed Text in subr1

" After  invoking SUBR1: Global text