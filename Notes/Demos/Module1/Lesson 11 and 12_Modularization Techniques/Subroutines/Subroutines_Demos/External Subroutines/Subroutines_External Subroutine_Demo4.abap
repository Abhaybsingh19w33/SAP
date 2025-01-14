REPORT ZPGM1.
DATA: pgm(10) TYPE c VALUE 'ZPGM2',
      sub(8) TYPE c.
sub = 'ADD'.
PERFORM (sub) IN PROGRAM (pgm).

sub = 'SUBTRACT'.
PERFORM (sub) IN PROGRAM (pgm).

" _____________________________________________________

REPORT ZPGM2.

FORM ADD.
  WRITE: / 'This is add subroutine'.
ENDFORM.

FORM SUBTRACT.
  WRITE: / 'This is subtract subroutine'.
ENDFORM.