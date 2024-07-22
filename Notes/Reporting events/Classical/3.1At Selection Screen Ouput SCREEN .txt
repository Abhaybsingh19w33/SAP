REPORT ZYNY_REPORTING_EVENT_01.

PARAMETERS:empno(4) TYPE n,
           ename(10) TYPE c.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF SCREEN-NAME = 'ENAME'.
        SCREEN-ACTIVE = 1. " IF ACTIVE IS SET TO 0, THEN THE FIELD IS NOT DISPLAYED
                           " IF ACTIVE IS SET TO 1, THEN THE FIELD IS DISPLAYED
        MODIFY SCREEN.
    ENDIF.
  ENDLOOP.

START-OF-SELECTION.
 WRITE :/ 'Ename is :', ename.
 WRITE :/ 'Empno is :', empno.

*======================
*If the above is changed to SCREEN-INPUT = 0,  grey out , YOU CANNOT ENTER THE INPUT
*If the above is changed to SCREEN-invisible = 1, like a password field. You can type but cannot see what has been typed(  *******)