REPORT ZYNY_REPORTING_EVENT_01 NO STANDARD PAGE HEADING.

PARAMETERS P1(8).

* Assume start-of-selection
WRITE: / 'p1 = ', P1.

INITIALIZATION.
  P1 = 'Init'.

END-OF-SELECTION.
  WRITE: /(14) SY-ULINE,
         /     'End of  program'.

TOP-OF-PAGE.
  WRITE: /  'Top of page'.
  SKIP.

*In the above case Initialization event will be fired first.
*i.e on the first screen
*it shows p1=INIT
*when we press f8 on the above screen
*
*we see the output as below.
*
*
*This is My title
*p1=Init
*-------------
*End of program
*
*i.e. top-of-page is fired , then start of selection is fired and then end-of-selection is fired.
*See debugging