REPORT ZAT_ALV_DEMO07.

TYPES : BEGIN OF ty_spfli,  "User defined internal table type
          carrid    TYPE spfli-carrid,
          connid    TYPE spfli-connid,
          countryfr TYPE spfli-countryfr,
          cityfrom  TYPE spfli-cityfrom,
        END OF ty_spfli.

DATA : it_spfli TYPE TABLE OF ty_spfli, "SPFLI internal table
       wa_spfli TYPE ty_spfli. "work area

DATA : t_fcat_spfli TYPE slis_t_fieldcat_alv. "field catalog for SPFLI table
DATA : w_fcat_spfli LIKE LINE OF t_fcat_spfli.

TYPES : BEGIN OF ty_sflight,
          carrid TYPE sflight-carrid,
          connid TYPE sflight-connid,
          fldate TYPE sflight-fldate,
          price  TYPE sflight-price,
        END OF ty_sflight.

DATA : it_sflight TYPE TABLE OF ty_sflight, "SFLIGHT internal table
       wa_sflight TYPE ty_sflight.
DATA : t_fcat_sflight TYPE slis_t_fieldcat_alv. "SFLIGHT field catalog
DATA : w_fcat_sflight LIKE LINE OF t_fcat_sflight.

DATA s_events TYPE slis_t_event.

DATA s_layout TYPE slis_layout_alv.
s_layout-zebra = 'X'.

PARAMETERS : p_carrid TYPE spfli-carrid. "CARRID type input

START-OF-SELECTION.
  PERFORM get_data.
  PERFORM create_fcat_spfli.
  PERFORM create_fcat_sflight.
  PERFORM block_list_init.
  PERFORM block_list_append_spfli.
  PERFORM block_list_append_sflight.

  CALL FUNCTION 'REUSE_ALV_BLOCK_LIST_DISPLAY' . "display blocked list

FORM get_data.
  SELECT carrid
         connid
         countryfr
         cityfrom
         FROM spfli "get SPFLI data
    INTO TABLE it_spfli  WHERE carrid = p_carrid.
  IF NOT it_spfli IS INITIAL .
    SELECT  carrid connid
            fldate
            price FROM sflight INTO TABLE it_sflight "get flight data
      FOR ALL ENTRIES IN it_spfli WHERE carrid = it_spfli-carrid.
  ENDIF.
ENDFORM.

FORM create_fcat_spfli.
  w_fcat_spfli-col_pos       = '1'. "coloum position
  w_fcat_spfli-fieldname     = 'CARRID'. "column name
  w_fcat_spfli-ref_tabname   = 'SPFLI'. "table
  w_fcat_spfli-ref_fieldname = 'CARRID'. "reference field, it will show descriptions automatically
  APPEND w_fcat_spfli TO t_fcat_spfli.
  CLEAR w_fcat_spfli.

  w_fcat_spfli-col_pos       = '2'.
  w_fcat_spfli-fieldname     = 'CONNID'.
  w_fcat_spfli-ref_tabname   = 'SPFLI'.
  w_fcat_spfli-ref_fieldname = 'CONNID'.
  APPEND w_fcat_spfli TO t_fcat_spfli.
  CLEAR w_fcat_spfli.

  w_fcat_spfli-col_pos       = '3'.
  w_fcat_spfli-fieldname     = 'COUNTRYFR'.
  w_fcat_spfli-ref_tabname   = 'SPFLI'.
  w_fcat_spfli-ref_fieldname = 'COUNTRYFR'.
  APPEND w_fcat_spfli TO t_fcat_spfli.
  CLEAR w_fcat_spfli.

  w_fcat_spfli-col_pos       = '4'.
  w_fcat_spfli-fieldname     = 'CITYFROM'.
  w_fcat_spfli-ref_tabname   = 'SPFLI'.
  w_fcat_spfli-ref_fieldname = 'CITYFROM'.
  APPEND w_fcat_spfli TO t_fcat_spfli.
  CLEAR w_fcat_spfli.
ENDFORM.

FORM create_fcat_sflight.
***build fcat for SFLIGHT
  w_fcat_sflight-col_pos       = '1'.
  w_fcat_sflight-fieldname     = 'CARRID'.
  w_fcat_sflight-ref_tabname   = 'SFLIGHT'.
  w_fcat_sflight-fieldname = 'CARRID'.
  APPEND w_fcat_sflight TO t_fcat_sflight.
  CLEAR w_fcat_sflight.

  w_fcat_sflight-col_pos       = '2'.
  w_fcat_sflight-fieldname     = 'CONNID'.
  w_fcat_sflight-ref_tabname   = 'SFLIGHT'.
  w_fcat_spfli-ref_fieldname = 'CONNID'.
  APPEND w_fcat_sflight TO t_fcat_sflight.
  CLEAR w_fcat_sflight.

  w_fcat_sflight-col_pos       = '3'.
  w_fcat_sflight-fieldname     = 'FLDATE'.
  w_fcat_sflight-ref_tabname   = 'SFLIGHT'.
  w_fcat_sflight-ref_fieldname = 'FLDATE'.
  APPEND w_fcat_sflight TO t_fcat_sflight.
  CLEAR w_fcat_sflight.

  w_fcat_sflight-col_pos       = '3'.
  w_fcat_sflight-fieldname     = 'PRICE'.
  w_fcat_sflight-ref_tabname   = 'SFLIGHT'.
  w_fcat_sflight-ref_fieldname = 'PRICE'.
  APPEND w_fcat_sflight TO t_fcat_sflight.
  CLEAR w_fcat_sflight.
ENDFORM.

FORM block_list_init.
  CALL FUNCTION 'REUSE_ALV_BLOCK_LIST_INIT' "initialize Block List ALV
    EXPORTING
      i_callback_program = sy-repid.
ENDFORM.

FORM block_list_append_spfli.
  CALL FUNCTION 'REUSE_ALV_BLOCK_LIST_APPEND' "append ALV lists
    EXPORTING
      is_layout   = s_layout "set layout
*      it_fieldcat = t_fcat_spfli "set field catalog
     i_tabname   = 'IT_SPFLI' "table
      it_events   = s_events "events
    TABLES
      t_outtab    = it_spfli. "out put table

  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
ENDFORM.

FORM block_list_append_sflight.
  CALL FUNCTION 'REUSE_ALV_BLOCK_LIST_APPEND' "append ALV lists
    EXPORTING
      is_layout   = s_layout "set layout
      it_fieldcat = t_fcat_sflight "set field catalog
      i_tabname   = 'IT_SFLIGHT' "table
      it_events   = s_events "events
    TABLES
      t_outtab    = it_sflight. "out put table

  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
ENDFORM.