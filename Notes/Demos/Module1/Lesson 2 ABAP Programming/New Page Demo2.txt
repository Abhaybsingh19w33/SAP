*To trigger a page break during list processing, 
*use the basic form of the 
*NEW-PAGE statement: 
*Syntax: NEW-PAGE. 
*This statement ends the current page.
*All other output appears on a new page. 
REPORT ZCAP_REP LINE-SIZE 40.
TOP-OF-PAGE.
WRITE: 'TOP-OF-PAGE', SY-PAGNO. 
ULINE AT /(17).
START-OF-SELECTION.
DO 2 TIMES.
   WRITE / 'Outer Loop:'. 
   DO 3 TIMES. 
     WRITE / 'Inner: sy-index'.
   ENDDO.
NEW-PAGE.
ENDDO.


	

