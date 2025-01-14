REPORT Z LINE-COUNT 20(1) NO STANDARD PAGE HEADING.
* In this example, the statement In end of page event is displayed

TOP-OF-PAGE.
  WRITE: / 'In TOP-OF-PAGE Event pageno is:', SY-PAGNO.

END-OF-PAGE.
  WRITE: 'END-OF-PAGE Event', SY-DATUM.

START-OF-SELECTION.
  DO 480 TIMES.
    WRITE : / 'In Loop SY-INDEX:', SY-INDEX.
  ENDDO.