*&---------------------------------------------------------------------*
*& Report ZRT_SMARTFORMS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrt_smartforms_table.
PARAMETERS p_carrid TYPE s_carr_id.
DATA : lt_sflight TYPE ztt_sflight_rt.

DATA :  fm TYPE rs38l_fnam.

SELECT carrid
      connid
      fldate
      SEATSMAX
   FROM sflight INTO TABLE lt_sflight
   WHERE carrid EQ p_carrid.

CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
  EXPORTING
    formname = 'ZHN_5_TABLES_CODE' "name of the smartform
*   VARIANT  = ' '
*   DIRECT_CALL              = ' '
  IMPORTING
    fm_name  = fm
  EXCEPTIONS
    NO_FORM  = 1
    NO_FUNCTION_MODULE       = 2
    OTHERS   = 3.
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

CALL FUNCTION fm
  EXPORTING
*   ARCHIVE_INDEX              =
*   ARCHIVE_INDEX_TAB          =
*   ARCHIVE_PARAMETERS         =
*   CONTROL_PARAMETERS         =
*   MAIL_APPL_OBJ              =
*   MAIL_RECIPIENT             =
*   MAIL_SENDER                =
*   OUTPUT_OPTIONS             =
*   USER_SETTINGS              = 'X'
    it_sflight = lt_sflight
* IMPORTING
*   DOCUMENT_OUTPUT_INFO       =
*   JOB_OUTPUT_INFO            =
*   JOB_OUTPUT_OPTIONS         =
*   IT_S       =
  EXCEPTIONS
    FORMATTING_ERROR           = 1
    INTERNAL_ERROR             = 2
    SEND_ERROR = 3
    USER_CANCELED              = 4
    OTHERS     = 5.
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.