REPORT Z LINE-SIZE 40 NO STANDARD PAGE HEADING.
WRITE  '1'.
WRITE /'2'.
WRITE /'3'.
WRITE /'4'.
WRITE /'5'.
WRITE /'6'.

AT PF6.
  WRITE 'F6 is pressed'.

AT PF8.
  WRITE 'F8 is pressed'.
*____________________________________________

REPORT Z LINE-SIZE 40 NO STANDARD PAGE HEADING.
WRITE  '1'.
WRITE /'2'.
WRITE /'3'.
WRITE /'4'.
WRITE /'5'.
WRITE /'6'.

AT PF6.
  WRITE 'F6 is pressed'.
  WRITE: 'SY-UCOMM:', SY-UCOMM.

AT PF8.
  WRITE 'F8 is pressed'.
  WRITE: 'SY-UCOMM:', SY-UCOMM.






