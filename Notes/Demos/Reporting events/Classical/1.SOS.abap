*&---------------------------------------------------------------------*
*& Report  ZRTC_CLASSICALEVENTS1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZRTC_CLASSICALEVENTS3 NO STANDARD PAGE HEADING LINE-COUNT 10(2).

END-OF-SELECTION.
  WRITE / '3. end-of-selection'.

START-OF-SELECTION.
  WRITE / '2. start-of-selection'.

INITIALIZATION.
  WRITE / '1. initialization'.

OUTPUT 
1. initialization
2. start-of-selection
3. end-of-selection

"EVEN IF CODE IS WRITTEN IN WRONG SEQUENCE, THE OUTPUT IS IN RIGHT SEQUENCE. 