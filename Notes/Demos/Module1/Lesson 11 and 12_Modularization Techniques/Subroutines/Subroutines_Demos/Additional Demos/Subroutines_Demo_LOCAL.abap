REPORT  Z.
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