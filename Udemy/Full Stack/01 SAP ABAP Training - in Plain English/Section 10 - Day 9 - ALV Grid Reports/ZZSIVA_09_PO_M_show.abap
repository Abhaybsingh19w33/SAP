*&---------------------------------------------------------------------*
*&  Include           ZZSIVA_09_PO_M_SHOW
*&---------------------------------------------------------------------*
START-OF-SELECTION.

  PERFORM fetch_data.
  PERFORM prepare_fldcat.
  PERFORM prepare_layout.
  PERFORM fill_events.
  PERFORM call_alv.
*&---------------------------------------------------------------------*
*&      Form  FETCH_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM fetch_data .
  SELECT * FROM zzsiva_po_m
    INTO CORRESPONDING FIELDS OF TABLE it_po
    WHERE ebeln IN s_ebeln
    AND   team  IN s_team.

  IF sy-subrc NE 0. " no data found
    MESSAGE 'No data found' TYPE 'I'.
  ENDIF.

ENDFORM.                    " FETCH_DATA
*&---------------------------------------------------------------------*
*&      Form  PREPARE_FLDCAT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM prepare_fldcat .
  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
   EXPORTING
*     I_PROGRAM_NAME               =
*     I_INTERNAL_TABNAME           =
     i_structure_name             = 'ZZSIVA_PO_M'
*     I_CLIENT_NEVER_DISPLAY       = 'X'
*     I_INCLNAME                   =
*     I_BYPASSING_BUFFER           =
*     I_BUFFER_ACTIVE              =
    CHANGING
      ct_fieldcat                  = it_fldcat
*   EXCEPTIONS
*     INCONSISTENT_INTERFACE       = 1
*     PROGRAM_ERROR                = 2
*     OTHERS                       = 3
            .
  IF sy-subrc = 0.
    wa_fldcat-edit = 'X'.
    MODIFY it_fldcat FROM wa_fldcat TRANSPORTING edit WHERE fieldname = 'STATUS'.
    MODIFY it_fldcat FROM wa_fldcat TRANSPORTING edit WHERE fieldname = 'TEAM'.

    wa_fldcat-hotspot = 'X'.
    MODIFY it_fldcat FROM wa_fldcat TRANSPORTING hotspot WHERE fieldname = 'EBELN'.
  ENDIF.


ENDFORM.                    " PREPARE_FLDCAT
*&---------------------------------------------------------------------*
*&      Form  CALL_ALV
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM call_alv .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
   EXPORTING
*     I_INTERFACE_CHECK                 = ' '
*     I_BYPASSING_BUFFER                = ' '
*     I_BUFFER_ACTIVE                   = ' '
     i_callback_program                = sy-repid
*     I_CALLBACK_PF_STATUS_SET          = ' '
*     I_CALLBACK_USER_COMMAND           = ' '
*     I_CALLBACK_TOP_OF_PAGE            = ' '
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME                  =
*     I_BACKGROUND_ID                   = ' '
*     I_GRID_TITLE                      =
*     I_GRID_SETTINGS                   =
     is_layout                         = wa_layout
     it_fieldcat                       = it_fldcat
*     IT_EXCLUDING                      =
*     IT_SPECIAL_GROUPS                 =
*     IT_SORT                           =
*     IT_FILTER                         =
*     IS_SEL_HIDE                       =
*     I_DEFAULT                         = 'X'
*     I_SAVE                            = ' '
*     IS_VARIANT                        =
     it_events                         = it_events
*     IT_EVENT_EXIT                     =
*     IS_PRINT                          =
*     IS_REPREP_ID                      =
*     I_SCREEN_START_COLUMN             = 0
*     I_SCREEN_START_LINE               = 0
*     I_SCREEN_END_COLUMN               = 0
*     I_SCREEN_END_LINE                 = 0
*     I_HTML_HEIGHT_TOP                 = 0
*     I_HTML_HEIGHT_END                 = 0
*     IT_ALV_GRAPHICS                   =
*     IT_HYPERLINK                      =
*     IT_ADD_FIELDCAT                   =
*     IT_EXCEPT_QINFO                   =
*     IR_SALV_FULLSCREEN_ADAPTER        =
*   IMPORTING
*     E_EXIT_CAUSED_BY_CALLER           =
*     ES_EXIT_CAUSED_BY_USER            =
    TABLES
      t_outtab                          = it_po
*   EXCEPTIONS
*     PROGRAM_ERROR                     = 1
*     OTHERS                            = 2
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


ENDFORM.                    " CALL_ALV
*&---------------------------------------------------------------------*
*&      Form  FILL_EVENTS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM fill_events .
  wa_events-name = 'PF_STATUS_SET'.
  wa_events-form = 'F_PF_STATUS_SET'.
  APPEND wa_events TO it_events.
  CLEAR wa_events.

  wa_events-name = 'USER_COMMAND'.
  wa_events-form = 'F_USER_COMMAND'.
  APPEND wa_events TO it_events.

ENDFORM.                    " FILL_EVENTS

*&---------------------------------------------------------------------*
*&      Form  F_PF_STATUS_SET
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM f_pf_status_set USING rt_extab TYPE slis_t_extab.

  SET PF-STATUS 'STANDARD' EXCLUDING rt_extab.
ENDFORM.                    "F_PF_STATUS_SET


*&---------------------------------------------------------------------*
*&      Form  F_USER_COMMAND
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->R_UCOMM      text
*      -->RS_SELFIELD  text
*----------------------------------------------------------------------*
FORM f_user_command USING r_ucomm TYPE sy-ucomm
                          rs_selfield TYPE slis_selfield.

  DATA : it_ekko TYPE TABLE OF sval,
         wa_ekko TYPE sval.

  DATA : it_po_buffer TYPE TABLE OF ty_po,
         wa_po_buffer TYPE ty_po.

  DATA : it_zzsiva_po_m TYPE TABLE OF zzsiva_po_m,
         wa_zzsiva_po_m LIKE LINE OF it_zzsiva_po_m.

  CASE r_ucomm.
    WHEN '&IC1'.
      IF rs_selfield-fieldname = 'EBELN'.
        SET PARAMETER ID : 'BES' FIELD rs_selfield-value.
        CALL TRANSACTION 'ME23N'.
      ENDIF.
    WHEN 'SAVE'.
      LOOP AT it_po INTO wa_po.
        MOVE-CORRESPONDING wa_po TO wa_zzsiva_po_m.
        UPDATE zzsiva_po_m FROM wa_zzsiva_po_m.
      ENDLOOP.
      rs_selfield-refresh = 'X'.
    WHEN 'ADD'.
      wa_ekko-tabname = 'EKKO'.
      wa_ekko-fieldname = 'EBELN'.
      APPEND wa_ekko TO it_ekko.

      CALL FUNCTION 'POPUP_GET_VALUES'
        EXPORTING
*         NO_VALUE_CHECK        = ' '
          popup_title           = 'eNTER po'
*         START_COLUMN          = '5'
*         START_ROW             = '5'
*       IMPORTING
*         RETURNCODE            =
        TABLES
          fields                = it_ekko
*       EXCEPTIONS
*         ERROR_IN_FIELDS       = 1
*         OTHERS                = 2
                .
      IF sy-subrc = 0.

        READ TABLE it_ekko INTO wa_ekko INDEX 1.

        SELECT  ebeln
                ebelp
                txz01
                matnr
                menge
                meins
                netpr
                peinh
          FROM ekpo INTO CORRESPONDING FIELDS OF TABLE it_po_buffer
          WHERE ebeln = wa_ekko-value.

        IF sy-subrc = 0.
          INSERT LINES OF it_po_buffer INTO it_po INDEX 1.
          rs_selfield-refresh = 'X'.

          IF sy-subrc = 0.
            LOOP AT it_po_buffer INTO wa_po_buffer.
              MOVE-CORRESPONDING wa_po_buffer TO wa_zzsiva_po_m.
              APPEND wa_zzsiva_po_m TO it_zzsiva_po_m.
            ENDLOOP.
            INSERT zzsiva_po_m FROM TABLE it_zzsiva_po_m.
            IF sy-subrc = 0.
              MESSAGE 'PO Inserted' TYPE 'I'.
            ELSE.
              MESSAGE ' PO Could not be inserted' TYPE 'E'.
            ENDIF.
          ENDIF.
        ENDIF.
      ENDIF.

    WHEN 'DELETE'.
      LOOP AT it_po INTO wa_po WHERE box = 'X'.
        DELETE FROM zzsiva_po_m WHERE ebeln = wa_po-ebeln.
      ENDLOOP.

      DELETE it_po WHERE box = 'X'.
      rs_selfield-refresh = 'X'.

  ENDCASE.
ENDFORM.                    "F_USER_COMMAND
*&---------------------------------------------------------------------*
*&      Form  PREPARE_LAYOUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM prepare_layout .
  wa_layout-box_fieldname = 'BOX'.
ENDFORM.                    " PREPARE_LAYOUT