*&---------------------------------------------------------------------*
*& Report  ZYNY_TEST2
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZYNY_TEST2.

data:  char(4) type c value 'abcd',
       num  type i value 1234.

start-of-selection.
    char = num . "allowed
    num  = char. "not allowed  if char contains characters
                " allowed  if char contains numeric values ie.  data:  char(4) type c value 4567,
    WRITE :/ 'After Move'.
    WRITE :/  ' Char :' , char.
    WRITE :/  ' Num :' , Num.