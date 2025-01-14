REPORT  Z.
DATA F1 VALUE 'X'.
PERFORM S1.
WRITE: / 'After invoking s1'.

FORM S1.
  WRITE / 'In s1'.
  EXIT.
  WRITE / 'After Exit in S1'.
ENDFORM.

*The exit statement in the subroutine exits the
*subroutine and  control goes to the statement
*after "Perform s1"

*The exit statement in the subroutine s1 comes
*out of the subroutine s1 and goes to the statement after perform s1