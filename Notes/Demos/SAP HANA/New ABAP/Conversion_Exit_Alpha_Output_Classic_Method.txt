REPORT Z.
DATA: V_CHAR(10).

V_CHAR = '00001234'.

"This function module will remove leading zeroes..
CALL FUNCTION 'CONVERSION_EXIT_ALPHA_OUTPUT'
  EXPORTING
      INPUT = V_CHAR
  IMPORTING
      OUTPUT = V_CHAR.

write: / v_char.