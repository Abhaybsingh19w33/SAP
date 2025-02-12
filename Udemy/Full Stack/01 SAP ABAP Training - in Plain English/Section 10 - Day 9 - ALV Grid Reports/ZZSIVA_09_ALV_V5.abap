**Events in ALV

REPORT zzsiva_09_alv_v5 .

TYPE-POOLS : slis.

TABLES : ekpo.

TYPES: BEGIN OF ty_ekpo,
        ebeln TYPE ekpo-ebeln,
        ebelp TYPE ekpo-ebelp,
        matnr TYPE ekpo-matnr,
        txz01 TYPE ekpo-txz01,
        menge TYPE ekpo-menge,
        netpr TYPE ekpo-netpr,
      END OF ty_ekpo.

DATA : it_ekpo    TYPE TABLE OF ty_ekpo,
       it_sort    TYPE slis_t_sortinfo_alv,
       it_events  TYPE slis_t_event,
       it_fldcat  TYPE slis_t_fieldcat_alv,
       wa_ekpo    TYPE ty_ekpo,
       wa_fldcat  TYPE slis_fieldcat_alv,
       wa_sort    TYPE slis_sortinfo_alv,
       wa_events  TYPE slis_alv_event.


SELECT-OPTIONS : s_ebeln FOR ekpo-ebeln.

START-OF-SELECTION.
  PERFORM fetch_data.
  PERFORM prepare_fldcat.
  PERFORM fill_events.
  PERFORM show_data.




*&---------------------------------------------------------------------*
*&      Form  FETCH_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM fetch_data .

  SELECT ebeln
         ebelp
         matnr
         txz01
         menge
         netpr
    FROM ekpo INTO TABLE it_ekpo
    WHERE ebeln IN s_ebeln.

ENDFORM.                    " FETCH_DATA

*&---------------------------------------------------------------------*
*&      Form  SHOW_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM show_data .

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      it_fieldcat        = it_fldcat
      i_callback_program = sy-repid
      it_sort            = it_sort
      it_events          = it_events
    TABLES
      t_outtab           = it_ekpo.

ENDFORM.                    " SHOW_DATA


*&---------------------------------------------------------------------*
*&      Form  PREPARE_FLDCAT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM prepare_fldcat .


  wa_fldcat-fieldname   = 'EBELN'.
  wa_fldcat-tabname     = 'IT_EKPO'.
  wa_fldcat-seltext_m   = 'Purchase Order'.
  wa_fldcat-key         = 'X'.
  APPEND wa_fldcat TO it_fldcat.
  CLEAR wa_fldcat.

  wa_fldcat-fieldname   = 'EBELP'.
  wa_fldcat-tabname     = 'IT_EKPO'.
  wa_fldcat-seltext_m   = 'Item'.
  wa_fldcat-key         = 'X'.
  APPEND wa_fldcat TO it_fldcat.
  CLEAR wa_fldcat.

  wa_fldcat-fieldname   = 'MATNR'.
  wa_fldcat-tabname     = 'IT_EKPO'.
  wa_fldcat-seltext_m   = 'Material'.
  APPEND wa_fldcat TO it_fldcat.
  CLEAR wa_fldcat.

  wa_fldcat-fieldname   = 'TXZ01'.
  wa_fldcat-tabname     = 'IT_EKPO'.
  wa_fldcat-seltext_m   = 'Short Text'.
  APPEND wa_fldcat TO it_fldcat.
  CLEAR wa_fldcat.

  wa_fldcat-fieldname   = 'MENGE'.
  wa_fldcat-tabname     = 'IT_EKPO'.
  wa_fldcat-seltext_m   = 'Quantity'.
  APPEND wa_fldcat TO it_fldcat.
  CLEAR wa_fldcat.

  wa_fldcat-fieldname   = 'NETPR'.
  wa_fldcat-tabname     = 'IT_EKPO'.
  wa_fldcat-seltext_m   = 'Price'.
  wa_fldcat-do_sum      = 'X'.
  APPEND wa_fldcat TO it_fldcat.
  CLEAR wa_fldcat.

**  Set Sorting options.
**  Only sorted fields can be the basis for sub totals.

  wa_sort-fieldname     = 'EBELN'.
  wa_sort-up            = 'X'.
  wa_sort-subtot        = 'X'.
  APPEND wa_sort TO it_sort.

ENDFORM.                    " PREPARE_FLDCAT

*&---------------------------------------------------------------------*
*&      Form  fill_EVENTS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM fill_events .
  CALL FUNCTION 'REUSE_ALV_EVENTS_GET'
    IMPORTING
      et_events = it_events.
  IF sy-subrc = 0.
**  Populate the TOP-OF-PAGE event
    READ TABLE it_events INTO wa_events WITH KEY name = 'TOP_OF_PAGE'.
    IF sy-subrc = 0.
      wa_events-form = 'F_TOP_OF_PAGE'.
      MODIFY it_events FROM wa_events INDEX sy-tabix.
    ENDIF.
  ENDIF.

ENDFORM.                    " GET_EVENTS

*&---------------------------------------------------------------------*
*&      Form  f_top_of_page
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM f_top_of_page.

  DATA : it_lheader TYPE slis_t_listheader,
         wa_lheader TYPE slis_listheader.

  wa_lheader-typ  = 'H'.
  wa_lheader-info = 'Purchase order items'.
  APPEND wa_lheader TO it_lheader.

  wa_lheader-typ  = 'S'.
  wa_lheader-info = sy-uname.
  APPEND wa_lheader TO it_lheader.

  wa_lheader-typ  = 'A'.
  wa_lheader-info = sy-datum.
  APPEND wa_lheader TO it_lheader.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = it_lheader
      I_LOGO             = 'AALOGO'
*     I_END_OF_LIST_GRID =
*     I_ALV_FORM         =
    .


ENDFORM.                    "f_top_of_page