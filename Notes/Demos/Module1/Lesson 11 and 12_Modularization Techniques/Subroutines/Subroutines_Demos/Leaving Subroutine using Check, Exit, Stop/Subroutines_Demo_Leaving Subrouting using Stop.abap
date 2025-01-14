REPORT Z.
DATA F1 VALUE 'X'.
PERFORM S1.
WRITE: / 'After invoking S1'.
*
END-OF-SELECTION.
  WRITE:  'In end of selection'.

FORM S1.
 WRITE: / 'In S1'.
 STOP.
 WRITE / 'After Stop in S1'.
ENDFORM.

*A stop statement within the subroutine transfers control directly to end-of-selection.

*STOP is a statement which is used to STOP processing
*an event block,
*ex: IF i have two EVENTS start-OF-SELECTION
*and END-OF-SELECTION in my PROGRAM,
*IF i use STOP keyword in START-OF-SELECTION,
*the keyword will exit START-OF-SELECTION and go to
*END-OF-SELECTION.

PERFORM display.
WRITE: / 'This will not be displayed due to STOP'.
*
END-OF-SELECTION.
  WRITE:  'In end of selection'.

FORM display.
 WRITE: / 'In display'.
* EXIT.
 STOP.
 WRITE / 'This will not be displayed as it is after sTOP'.
ENDFORM.