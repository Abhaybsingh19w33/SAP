REPORT  Z.
DATA F1 VALUE 'X'.
PERFORM S2.
WRITE: / 'After invoking S2'.

FORM S2.
  WRITE / 'In s2'.
  CHECK F1 = 'Y'.
  WRITE / 'After Check in S2'.
ENDFORM.

*In form s2
*when the statement check f1 = 'Y', is encountered
*control comes out of the subroutine
*since the check statement leaves the subroutine.
*use check to terminate a subroutine conditionally.
*IF the logical expression in the CHECK statement IS untrue,
*the subroutine is terminated,
*AND the calling program resumes
*processing after the PERFORM statement.