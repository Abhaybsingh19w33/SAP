REPORT z.

SELECTION-SCREEN BEGIN OF BLOCK blk1 WITH FRAME TITLE text1.
  PARAMETERS: num1  TYPE  i,
              num2  TYPE  i.
SELECTION-SCREEN END OF BLOCK blk1.

SELECTION-SCREEN BEGIN OF BLOCK blk2 WITH FRAME TITLE text2.
  PARAMETERS: num3  TYPE  i,
              num4  TYPE  i.
SELECTION-SCREEN END OF BLOCK blk2.

INITIALIZATION.
  TEXT1 = 'BLOCK1'. 
  TEXT2 = 'BLOCK2'.

START-OF-SELECTION.
  WRITE:/ 'Num1 is: ' , Num1.
  WRITE:/ 'Num2 is: ' , Num2.
  WRITE:/ 'Num3 is: ' , Num3.
  WRITE:/ 'Num4 is: ' , Num4.

AT SELECTION-SCREEN ON BLOCK BLK1.
  PERFORM validatenum1.

form validatenum1.
  IF num1 < 0 .
    MESSAGE 'Num1 cannot be -ve' type 'E'.
  ENDIF.
ENDFORM.