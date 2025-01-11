Report z.
DATA a TYPE i VALUE 4.

CASE a.
  WHEN 3.
    WRITE:/ a, 'Equals', 3.
  WHEN 4.
    WRITE:/ a, 'Equals', 4.
  WHEN OTHERS.
    WRITE:/ 'Not Found'.
ENDCASE.