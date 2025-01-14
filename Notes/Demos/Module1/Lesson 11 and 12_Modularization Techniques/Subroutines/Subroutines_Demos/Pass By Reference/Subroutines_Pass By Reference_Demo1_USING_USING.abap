REPORT Z.
DATA F1 VALUE 'A'.

WRITE: / 'Before invoking S1:',F1. "will display A
PERFORM S1 USING F1.
WRITE: / 'After  invoking S1:',F1. "will display X

FORM S1 USING P1.
  P1 = 'X'.
  WRITE: / 'In Subroutine S1:',P1. "will display X
ENDFORM.