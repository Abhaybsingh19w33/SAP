*If we do not give begin of line and end of line the two radio buttons get displayed on
*seperate lines with the labels as pmale and pfem
*However, since we give begin of line and end of line, both radio buttons appear on the same
*line adjacent to each other with no labels
*To give labels to radio button we use comments
*comments can be given only in begin of line end of line else we get runtime error
REPORT z.
SELECTION-SCREEN BEGIN OF BLOCK GRP1 WITH FRAME TITLE TEXTA.
SELECTION-SCREEN SKIP 1.
SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN COMMENT 5(10) TEXTM FOR FIELD PMALE.
  PARAMETERS PMALE       RADIOBUTTON GROUP GRP1.
  SELECTION-SCREEN COMMENT 20(10) TEXTF FOR FIELD PFEM.
  PARAMETERS PFEM        RADIOBUTTON GROUP GRP1.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN SKIP 1.
SELECTION-SCREEN END OF BLOCK GRP1.

INITIALIZATION.
  TEXTA = 'Frame Title'.
  TEXTM = 'Male'.
  TEXTF = 'Female'.

START-OF-SELECTION.
  IF PMALE = 'X'.
    WRITE:/ 'pmale:', PMALE.
  ELSEIF PFEM = 'X'.
    WRITE:/ 'female:', PFEM.
  ENDIF.

