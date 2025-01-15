REPORT Z.
DATA: V_CHAR(10).

V_CHAR = '1234    '.

* This function module will put leading zeroes..
CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
  EXPORTING
      INPUT = V_CHAR
  IMPORTING
      OUTPUT = V_CHAR.

write: / v_char.