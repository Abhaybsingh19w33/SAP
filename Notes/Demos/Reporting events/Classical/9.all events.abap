*&---------------------------------------------------------------------*
*& Report  ZRTC_CLASSICALEVENTS1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZRTC_CLASSICALEVENTS1 NO STANDARD PAGE HEADING LINE-COUNT 10(2).

DATA : WA TYPE sflight, IT TYPE TABLE OF sflight.

SELECTION-SCREEN BEGIN OF BLOCK B1 WITH FRAME.
  PARAMETERS: P1 TYPE s_carrid,
              P2 TYPE BUTXT.
  SELECT-OPTIONS S_carrid FOR WA-carrid.
SELECTION-SCREEN END OF BLOCK B1.

**********even initialisation*************
INITIALIZATION.
  P1 = 'AA'. " setting p1 value
  P2 = 'SAP'. " setting p2 value

  S_carrid-LOW = '0001'. "setting s_carrid value
  s_carrid-HIGH = '6000'.
  s_carrid-SIGN = 'I'.
  s_carrid-OPTION = 'BT'.
  APPEND s_carrid.

AT SELECTION-SCREEN ON P1.  "Validating P1

 SELECT SINGLE carrid  INTO  P1 FROM scarr WHERE carrid EQ p1 .
*   sy-subrc  = 0 if it is successful
*   sy-subrc  = 4, 8 if it is unsuccessful

  IF SY-SUBRC NE 0.
    MESSAGE 'invalid Carrid' TYPE 'E'.
  ENDIF.

AT SELECTION-SCREEN.
  IF P2 = ''.
    MESSAGE 'Course is Blank' TYPE 'E'.
  ENDIF.

START-OF-SELECTION.
  SELECT * FROM sflight INTO TABLE IT WHERE carrid IN S_carrid.

END-OF-SELECTION.
  LOOP AT IT INTO WA.
    WRITE: / WA-carrid, WA-connid.
  ENDLOOP.

  "T-O-P will be processed after start-of selection
  "But it is displayed  before start-of selection.
TOP-OF-PAGE.
  WRITE : 'Cairline code details' COLOR 1.

END-OF-PAGE.
  WRITE : / 'end of page' COLOR 3.
  WRITE : / 'end of page line 2' COLOR 3.