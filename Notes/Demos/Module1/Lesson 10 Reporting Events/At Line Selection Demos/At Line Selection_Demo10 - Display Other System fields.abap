*SY-LSIND	Index for the current list.
*SY-LISTI	Index of the last list displayed.
*SY-LILLI	Absolute number of a selected line in the list displayed.
*SY-CPAGE	Number of the upper-most displayed line in the list displayed.
*SY-LISEL Contents of the line from which the event was triggered.
*SY-CUCOL	Number of the column in the window where the cursor was last positioned in the list displayed.
*SY-CUROW	Number of the line in the window where the cursor was last positioned in the list displayed.
*SY-STACO	Number of the first column displayed in the list displayed.
*SY-STARO	Number of the first visible line in the top displayed page
*SY-PAGE  in the list displayed (not including header lines).
*SY-UCOMM Function code

REPORT ZYNY_REPORTING_EVENT_01 NO STANDARD PAGE HEADING.

DATA: VAR1(8) TYPE C VALUE 'Red',
      VAR2(8) TYPE C VALUE 'Blue',
      VAR3(8) TYPE C VALUE 'Green',
      VAR4(8) TYPE C VALUE 'Pink',
      VAR5(8) TYPE C VALUE 'Orange',
      VAR6(8) TYPE C VALUE 'Magenta'.

START-OF-SELECTION.
  WRITE: / VAR1.
  WRITE: / VAR2.
  WRITE: / VAR3.
  WRITE: / VAR4.
  WRITE: / VAR5.
  WRITE: / VAR6.

  WRITE: / 'SY-LSIND', SY-LSIND.
  WRITE: / 'Sy-pagno', SY-PAGNO.
  WRITE: / 'SY-LISTI', SY-LISTI. 'Index of the last list displayed'.
  WRITE: / 'SY-LILLI', SY-LILLI. 'Absolute number of a selected line in the list displayed'.
  WRITE: / 'SY-CPAGE', SY-CPAGE. 'Number of the upper-most displayed line in the list displayed'.
  WRITE: / 'SY-LISEL', SY-LISEL. 'Contents of the line from which the event was triggered'.
  WRITE: / 'SY-CUCOL', SY-CUCOL. 'Number of the column in the window where the cursor was last positioned in the list displayed'.
  WRITE: / 'SY-CUROW', SY-CUROW. 'Number of the line in the window where the cursor was last positioned in the list displayed'.
  WRITE: / 'SY-STACO', SY-STACO. 'Number of the first column displayed in the list displayed'.
  WRITE: / 'SY-STARO', SY-STARO. 'Number of the first visible line in the top displayed page'.
  WRITE: / 'SY-PAGE', SY-PAGE.   'in the list displayed not including header lines'.
  WRITE: / 'SY-UCOMM', SY-UCOMM. 'Function code'.

AT LINE-SELECTION.
  WRITE: / 'This is secondary list no:', SY-LSIND.
  WRITE: / 'Sy-lisel', SY-LISEL.
  WRITE: / 'Sy-curow', SY-CUROW.
  WRITE: / 'Sy-cucol', SY-CUCOL.
  WRITE: / 'sy-lilli', SY-LILLI.
  WRITE: / 'Sy-pagno', SY-PAGNO.
  WRITE: / 'SY-LISTI', SY-LISTI, 'Index of the last list displayed'.
  WRITE: / 'SY-LILLI', SY-LILLI, 'Absolute number of a selected line in the list displayed'.
  WRITE: / 'SY-CPAGE', SY-CPAGE, 'Number of the upper-most displayed line in the list displayed'.
  WRITE: / 'SY-LISEL', SY-LISEL, 'Contents of the line from which the event was triggered'.
  WRITE: / 'SY-CUCOL', SY-CUCOL, 'Number of the column in the window where the cursor was last positioned in the list displayed'.
  WRITE: / 'SY-CUROW', SY-CUROW, 'Number of the line in the window where the cursor was last positioned in the list displayed'.
  WRITE: / 'SY-STACO', SY-STACO, 'Number of the first column displayed in the list displayed'.
  WRITE: / 'SY-STARO', SY-STARO, 'Number of the first visible line in the top displayed page'.
  WRITE: / 'SY-PAGE',  SY-PAGE,  'in the list displayed not including header lines'.
  WRITE: / 'SY-UCOMM', SY-UCOMM, 'Function code'.