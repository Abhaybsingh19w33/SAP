REPORT Z.
INITIALIZATION.
PARAMETERS: PEMPNO(4)  TYPE N ,
            PENAME(10) TYPE C DEFAULT 'Radhika'.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF SCREEN-NAME = 'PENAME'.
      SCREEN-ACTIVE = 0. "Parameter cannot be seen and no data entry possible
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.

START-OF-SELECTION.
  WRITE :/ 'Ename is :', PENAME.
  WRITE :/ 'Empno is :', PEMPNO.