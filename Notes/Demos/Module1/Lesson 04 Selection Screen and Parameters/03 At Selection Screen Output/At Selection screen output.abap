REPORT z.

PARAMETERS : name(10) TYPE c.

START-OF-SELECTION.
  WRITE : / 'Name is:' , name.

INITIALIZATION.
  name = 'Chris'.

at SELECTION-SCREEN OUTPUT.
  name = 'ABC'.