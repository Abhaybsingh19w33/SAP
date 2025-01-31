REPORT z.
PARAMETERS: num1  TYPE  i,
            num2  TYPE  i.

At SELECTION-SCREEN.
  PERFORM validatenum1num2.

AT SELECTION-SCREEN ON NUM1.
  PERFORM validatenum1.

AT SELECTION-SCREEN ON NUM2.
  PERFORM validatenum2.

START-OF-SELECTION.
  WRITE num1.
  WRITE num2.

form validatenum1num2.
  IF num1 < 0 or num2 < 10.
    MESSAGE  'Enter proper values for Num1 and Num2' type 'E'.
  ENDIF.
ENDFORM.

form validatenum1.
  IF num1 < 0.
     MESSAGE  ' Num1 cannot be negative' type 'E'.

     ENDIF.
ENDFORM.

form validatenum2.
  IF num2 < 10.
    MESSAGE  'Num2 cannot be less than 10' type 'E'.
  ENDIF.
ENDFORM.