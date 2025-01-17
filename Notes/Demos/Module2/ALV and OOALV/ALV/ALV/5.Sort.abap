REPORT ZAT_ALV_DEMO05.

TYPE-POOLS slis .
TABLES sflight.
TYPES : BEGIN OF ty_sflight,
          carrid TYPE sflight-carrid,
          connid TYPE sflight-connid,
          fldate TYPE sflight-fldate,
          price  TYPE sflight-price,
        END OF ty_sflight.
DATA it_sflight TYPE TABLE OF ty_sflight .
DATA wa_sflight TYPE ty_sflight .

DATA it_fcat TYPE slis_t_fieldcat_alv .
DATA wa_fcat TYPE slis_fieldcat_alv.
"DATA wa_fcat LIKE LINE OF it_fcat .

DATA it_sort TYPE slis_t_sortinfo_alv .
data wa_sort TYPE slis_sortinfo_alv.
"DATA wa_sort LIKE LINE OF it_sort .

SELECT-OPTIONS : s_carrid FOR sflight-carrid.

START-OF-SELECTION .
  PERFORM get_data .
  PERFORM create_fcat.
  PERFORM sort.
  PERFORM disp_alv .

FORM get_data .
  SELECT carrid connid fldate price FROM sflight
      INTO TABLE it_sflight WHERE carrid IN s_carrid
  .
ENDFORM.                    " GET_DATA

FORM disp_alv .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      it_fieldcat        = it_fcat
      it_sort            = it_sort
    TABLES
      t_outtab           = it_sflight.
  IF sy-subrc NE 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
ENDFORM.                    " DISP_ALV

FORM create_fcat .
  wa_fcat-col_pos = '1' .
  wa_fcat-fieldname = 'CARRID' .
  wa_fcat-seltext_m = 'Airline' .
  wa_fcat-key = 'X' .
  APPEND wa_fcat TO it_fcat .
  CLEAR wa_fcat .

  wa_fcat-col_pos = '2' .
  wa_fcat-fieldname = 'CONNID' .
  wa_fcat-seltext_m = 'Flightno' .

  APPEND wa_fcat TO it_fcat .
  CLEAR wa_fcat .

  wa_fcat-col_pos = '3' .
  wa_fcat-fieldname = 'FLDATE' .
  wa_fcat-seltext_m = 'Date' .
  APPEND wa_fcat TO it_fcat .
  CLEAR wa_fcat .

  wa_fcat-col_pos = '4' .
  wa_fcat-fieldname = 'PRICE' .
  wa_fcat-seltext_m = 'Airfare' .
  wa_fcat-emphasize = 'C610'.
  APPEND wa_fcat TO it_fcat .
  CLEAR wa_fcat .

ENDFORM.                    " CREATE_FCAT

FORM sort .
  wa_sort-fieldname = 'CARRID'.
  wa_sort-up = 'X'.  "up - ascending order and down is desc
  APPEND wa_sort TO it_sort .

  wa_sort-fieldname = 'CONNID'.
  wa_sort-up = 'X'.
  APPEND wa_sort TO it_sort .
ENDFORM.