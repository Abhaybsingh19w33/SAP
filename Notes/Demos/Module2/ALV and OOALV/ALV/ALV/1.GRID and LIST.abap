REPORT ZAT_ALV_DEMO01.

data lv_carrid type S_CARR_ID.
DATA it_spfli TYPE TABLE OF spfli. "DECLARE INTERNAL TABLE FOR SPFLI
SELECT-OPTIONS: s_carrid FOR lv_carrid ."

START-OF-SELECTION.
  SELECT * FROM spfli INTO TABLE it_spfli
  WHERE carrid IN s_carrid .

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
   EXPORTING
    I_STRUCTURE_NAME                  =  'SPFLI'
     I_GRID_TITLE                      = ' GRid display'
    TABLES
      T_OUTTAB                          = it_spfli
   EXCEPTIONS
     PROGRAM_ERROR                     = 1
     OTHERS                            = 2
            .
  IF SY-SUBRC <> 0.
 Implement suitable error handling here
  ENDIF.

*---------------------------------------
  CALL FUNCTION 'REUSE_ALV_LIST_DISPLAY'
   EXPORTING
*     I_INTERFACE_CHECK              = ' '
*     I_BYPASSING_BUFFER             =
*     I_BUFFER_ACTIVE                = ' '
*     I_CALLBACK_PROGRAM             = ' '
*     I_CALLBACK_PF_STATUS_SET       = ' '
*     I_CALLBACK_USER_COMMAND        = ' '
     I_STRUCTURE_NAME               = 'SPFLI'
    TABLES
      T_OUTTAB                       = IT_SPFLI
*   EXCEPTIONS
*     PROGRAM_ERROR                  = 1
*     OTHERS                         = 2
            .
  IF SY-SUBRC <> 0.
  ENDIF.