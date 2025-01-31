*&---------------------------------------------------------------------*
*& Report  ZRTC_CLASSICALEVENTS1.


REPORT  ZRTC_CLASSICALEVENTS1 NO STANDARD PAGE HEADING LINE-COUNT 10(2).

DATA : WA TYPE sflight, IT TYPE TABLE OF sflight.

SELECT-OPTIONS S_carrid FOR WA-carrid.

START-OF-SELECTION.
  SELECT * FROM sflight 
      INTO TABLE IT WHERE carrid IN S_carrid.

END-OF-SELECTION.
  LOOP AT IT INTO WA.
    WRITE: / WA-carrid, WA-connid.
  ENDLOOP.

  "T-O-P will be processed after start-of selection
  "But it is displayed before start-of selection.
TOP-OF-PAGE.
  WRITE : 'Cairline code details' COLOR 1.

END-OF-PAGE.
  WRITE : / 'end of page' COLOR 3.
  WRITE : / 'end of page line 2' COLOR 3.