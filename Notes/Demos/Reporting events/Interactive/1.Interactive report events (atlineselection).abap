*&---------------------------------------------------------------------*
*& Report ZRTC_IREPORT_EVENTS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrtc_ireport_events.

WRITE : 'This is the basic report with list index', sy-lsind.	" OUTPUT -> 0

AT LINE-SELECTION.
  WRITE : / 'This is secondary report', sy-lsind.	

****************************************************************************

*WRITE : 'this is the basic report with list index', sy-lsind.
*
*AT LINE-SELECTION.
*  CASE sy-lsind.
*    WHEN 1 .
*      WRITE : / 'This is  first secondary report and list index is ', sy-lsind.
*    WHEN 2 .
*      WRITE : / 'This is  second secondary report and list index is ', sy-lsind.
*    WHEN 3 .
*      WRITE : / 'This is  third secondary report and list index is ', sy-lsind.
*  ENDCASE.

*TOP-OF-PAGE.
*  WRITE: 'Basic heading' COLOR 1.

*TOP-OF-PAGE DURING LINE-SELECTION .
*  CASE sy-lsind.
*    WHEN 1 .
*      WRITE : 'Secondary heading 1' COLOR 2.
*    WHEN 2 .
*      WRITE : 'Secondary heading 2' COLOR 2.
*    WHEN 3 .
*      WRITE : 'Secondary heading 3' COLOR 2.
*  ENDCASE.