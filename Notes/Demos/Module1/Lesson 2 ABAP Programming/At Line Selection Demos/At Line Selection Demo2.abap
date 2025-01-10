REPORT Z NO STANDARD PAGE HEADING.
WRITE  'This is the Basic List'.
WRITE / 'Double Click on any line of the basic list'.
WRITE / 'Or Single Click and press F2'.
WRITE / 'Or Single Click and press detail icon'.


AT LINE-SELECTION.
  WRITE: / 'This is the secondary List'.
  WRITE: / 'The List no is ', SY-LSIND.