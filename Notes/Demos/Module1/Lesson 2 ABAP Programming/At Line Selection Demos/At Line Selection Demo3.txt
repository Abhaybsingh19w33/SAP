REPORT Z NO STANDARD PAGE HEADING.
WRITE  'This is the Basic List'.
WRITE / 'Double Click on any line of the basic list'.
WRITE / 'Or Single Click and press F2'.
WRITE / 'Or Single Click and press detail icon'.

AT LINE-SELECTION.
  CASE  SY-LSIND.
    WHEN  1.
      WRITE: / 'This is the secondary List 1'.
    WHEN 2 .
      WRITE: / 'This is the secondary List 2'.
    WHEN  3.
      WRITE: / 'This is the secondary List 3'.
    WHEN 4 .
      WRITE: / 'This is the secondary List 4'.
    WHEN  5.
      WRITE: / 'This is the secondary List 5'.
    WHEN 6 .
      WRITE: / 'This is the secondary List 6'.
    WHEN  7.
      WRITE: / 'This is the secondary List 7'.
    WHEN 8 .
      WRITE: / 'This is the secondary List 8'.
    WHEN  9.
      WRITE: / 'This is the secondary List 9'.
    WHEN 10 .
      WRITE: / 'This is the secondary List 10'.
    WHEN 11.
      WRITE: / 'This is the secondary List 11'.
    WHEN 12 .
      WRITE: / 'This is the secondary List 12'.
    WHEN 13.
      WRITE: / 'This is the secondary List 13'.
    WHEN 14 .
      WRITE: / 'This is the secondary List 14'.
    WHEN 15.
      WRITE: / 'This is the secondary List 15'.
    WHEN 16 .
      WRITE: / 'This is the secondary List 16'.
    WHEN 17.
      WRITE: / 'This is the secondary List 17'.
    WHEN 18 .
      WRITE: / 'This is the secondary List 18'.
    WHEN 19.
      WRITE: / 'This is the secondary List 19'.
    WHEN 20 .
      WRITE: / 'This is the secondary List 20.. LAST'.
  ENDCASE.

  