REPORT Z.
DATA WA TYPE I.

START-OF-SELECTION.
  DO 10 TIMES.
    WA = SY-INDEX + 100.
    WRITE / WA.
    HIDE WA.
  ENDDO.

AT LINE-SELECTION.
  WRITE /:'This is secondary list:', SY-LSIND.
  WRITE /: 'WA IS :', WA.
  WRITE /: 'SY-LISEL IS :', SY-LISEL.

" _________________________________________________________
REPORT Z NO STANDARD PAGE HEADING.
DATA WA TYPE I VALUE 1.
DATA WA1 TYPE I VALUE 1.
DATA WA2 TYPE I VALUE 1.

START-OF-SELECTION.
  WRITE: /'This is Primary list:', SY-LSIND.

  DO 10 TIMES.
    WRITE / WA.
    HIDE WA.
    WA = SY-INDEX + 1.
  ENDDO.

AT LINE-SELECTION.
  IF SY-LSIND = 1.
    WRITE: /'This is secondary list:', SY-LSIND.
    WRITE: /'WA IS :', WA.
    WRITE: /'SY-LISEL IS :', SY-LISEL.
    SKIP.
    DO 10 TIMES.
      WA1 = SY-INDEX + 100.
      WRITE / WA1.
    ENDDO.
  ENDIF.
  IF SY-LSIND = 2.
    WRITE: /'This is secondary list:', SY-LSIND.
    WRITE: / 'WA IS :', WA.
    WRITE: / 'SY-LISEL IS :', SY-LISEL.
    SKIP.
    DO 10 TIMES.
      WA2 = SY-INDEX + 200.
      WRITE / WA2.
    ENDDO.
  ENDIF.
  IF SY-LSIND = 3.
    WRITE: /'This is secondary list:', SY-LSIND.
    WRITE: / 'WA IS :', WA.
    WRITE:/ 'SY-LISEL IS :', SY-LISEL.
  ENDIF.

