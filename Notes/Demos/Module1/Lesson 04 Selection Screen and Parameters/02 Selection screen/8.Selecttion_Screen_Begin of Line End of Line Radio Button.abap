REPORT ZVK1.
SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN COMMENT 5(10)  texta FOR FIELD p1.
  PARAMETERS: p1(5) TYPE c.
  
  SELECTION-SCREEN COMMENT 25(10) textb FOR FIELD p2.
  PARAMETERS: p2(5) TYPE c.
  
  SELECTION-SCREEN COMMENT 45(10) textc FOR FIELD p3.
  PARAMETERS  p3(5) TYPE c.
SELECTION-SCREEN END OF LINE.

INITIALIZATION.
  texta = 'Number1:'.
  textb = 'Number2:'.
  textc = 'Number3:'.

*If we do not give begin of line and end of line the two radio buttons get displayed on
*seperate lines with the labels as pmale and pfem
*However, since we give begin of line and end of line, both radio buttons appear on the same
*line adjacent to each other with no labels
*To give labels to radio buttob we use comments
*comments can be given only in begin of line end of line else we get runtime error
SELECTION-SCREEN BEGIN OF BLOCK grp1 WITH FRAME TITLE texta.
    SELECTION-SCREEN SKIP 1.

    SELECTION-SCREEN BEGIN OF LINE.
        SELECTION-SCREEN COMMENT 5(10) textm FOR FIELD pmale.
        PARAMETERS pmale RADIOBUTTON GROUP grp1.
        
        SELECTION-SCREEN COMMENT 20(10) textf FOR FIELD pfem.
        PARAMETERS pfem  RADIOBUTTON GROUP grp1.
    SELECTION-SCREEN END OF LINE.

    SELECTION-SCREEN SKIP 1.
SELECTION-SCREEN END OF BLOCK grp1.

INITIALIZATION.
  texta = 'Frame Title'.
  textm = 'Male'.
  textf = 'Female'.

START-OF-SELECTION.
  if pmale = 'X'.
    WRITE:/ 'pmale:', pmale.
  elseif pfem = 'X'.
    WRITE:/ 'female:', pfem.
  endif.