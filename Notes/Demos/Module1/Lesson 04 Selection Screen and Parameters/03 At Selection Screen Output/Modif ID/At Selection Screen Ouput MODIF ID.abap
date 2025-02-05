*&---------------------------------------------------------------------*
*& Report ZTR_SAP_MEMORY3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTR_SAP_MEMORY3.
PARAMETERS: TEST1(10) TYPE C MODIF ID SC1,
            TEST2(10) TYPE C MODIF ID SC2,
            TEST3(10) TYPE C MODIF ID SC1,
            TEST4(10) TYPE C MODIF ID SC2.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF SCREEN-GROUP1 = 'SC1'.
      SCREEN-INTENSIFIED = '1'.
      MODIFY SCREEN.
      CONTINUE.
    ENDIF.

    IF SCREEN-GROUP1 = 'SC2'.
      SCREEN-INTENSIFIED = '0'.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.