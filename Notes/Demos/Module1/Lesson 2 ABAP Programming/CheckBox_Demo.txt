REPORT Z.
DATA:   FLAG1(1) TYPE C VALUE ' ',
        FLAG2(1) TYPE C VALUE 'X',
        FLAG3(5) TYPE C VALUE 'xenon',
        FLAG4(5) TYPE C VALUE 'Yenon'.

WRITE: / 'Flag 1 ', FLAG1 AS CHECKBOX,
       / 'Flag 2 ', FLAG2 AS CHECKBOX,
       / 'Flag 3 ', FLAG3 AS CHECKBOX,
       / 'Flag 4 ', FLAG4 AS CHECKBOX.

SKIP.
IF FLAG1 = 'X' OR FLAG1 = 'x'.
  WRITE 'Flag1 is selected'.
ENDIF.

IF FLAG2 = 'X' OR FLAG2 = 'x'.
  WRITE 'Flag2 is selected'.
ENDIF.

IF FLAG3+0(1) = 'X' OR FLAG3+0(1) = 'x'.
  WRITE 'Flag3 is selected'.
ENDIF.

IF FLAG4 = 'X' OR FLAG4 = 'x'.
  WRITE 'Flag4 is selected'.
ENDIF.