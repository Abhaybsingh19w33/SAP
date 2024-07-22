*Refer to the demos(word document) for creating the status bar.
*The program can be executed only after that

REPORT z LINE-SIZE 40 NO STANDARD PAGE HEADING.
SET PF-STATUS 'Z104329STAT1MATHS'.
SET TITLEBAR 'Arithmetic Examples'.
DATA: NUMBER1 TYPE I VALUE 20,
      NUMBER2 TYPE I VALUE  5,
      RESULT  TYPE I.

START-OF-SELECTION.
  WRITE: / NUMBER1, '?', NUMBER2.

AT USER-COMMAND.
  CASE SY-UCOMM.
    WHEN 'ADD'.
      RESULT = NUMBER1 + NUMBER2.
    WHEN 'SUBT'.
      RESULT = NUMBER1 - NUMBER2.
    WHEN 'MULT'.
      RESULT = NUMBER1 * NUMBER2.
    WHEN 'DIVI'.
      RESULT = NUMBER1 / NUMBER2.
    WHEN 'EXIT'.
     LEAVE PROGRAM.

  ENDCASE.
  WRITE: / 'Result:', RESULt.