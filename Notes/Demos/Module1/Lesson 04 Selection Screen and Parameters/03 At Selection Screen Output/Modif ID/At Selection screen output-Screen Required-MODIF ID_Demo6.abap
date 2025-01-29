REPORT Z.
PARAMETERS:PEMPNO(4)  TYPE N,
           PENAME(10) TYPE C,
           PSAL       TYPE P DECIMALS 2 MODIF ID REQ, "modif is any 3 charactred word
           PCOMM      TYPE P DECIMALS 2 MODIF ID REQ.  "In this case REQ

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF SCREEN-GROUP1 = 'REQ'.
      SCREEN-REQUIRED = 1.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.

START-OF-SELECTION.
  WRITE :/ 'Ename  is :', PENAME.
  WRITE :/ 'Empno  is :', PEMPNO.
  WRITE :/ 'Salary is:', PSAL.
  WRITE :/ 'Comm   is :', PCOMM.