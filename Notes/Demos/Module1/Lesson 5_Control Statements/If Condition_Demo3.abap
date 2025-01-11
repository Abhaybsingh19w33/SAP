Report z.
DATA: a TYPE i VALUE 2.

IF a > 5.
  WRITE:/ a, 'Greater Than', 5.
ELSEIF a > 4.
  WRITE:/ a, 'Greater Than', 4.
ELSEIF a > 3.
  WRITE:/ a, 'Greater Than', 3.
ELSE.
  WRITE:/ a, 'Less Than', 3.
ENDIF.