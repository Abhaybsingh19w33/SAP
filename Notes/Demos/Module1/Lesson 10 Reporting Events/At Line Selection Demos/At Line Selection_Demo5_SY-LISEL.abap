REPORT Z.
START-OF-SELECTION.
  DO 10 TIMES.
    WRITE / SY-INDEX.
  ENDDO.

AT LINE-SELECTION.
  WRITE /:'This is secondary list:', SY-LSIND.
  WRITE /:'SY-LISEL is:', SY-LISEL.