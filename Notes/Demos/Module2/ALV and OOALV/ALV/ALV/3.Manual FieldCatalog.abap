REPORT ZAT_ALV_DEMO03.
"Manual creation of catalogue
TABLES : spfli.
*TYPE-POOLS slis .
TYPES : BEGIN OF ty_spfli,  "User defined internal table type
          carrid    TYPE spfli-carrid,
          connid    TYPE spfli-connid,
          countryfr TYPE spfli-countryfr,
          cityfrom  TYPE spfli-cityfrom,
        END OF ty_spfli.

DATA : it_spfli TYPE TABLE OF ty_spfli,
       wa_spfli TYPE ty_spfli,
       it_fcat  TYPE slis_t_fieldcat_alv,
       wa_fcat  TYPE slis_fieldcat_alv.

"DATA : wa_fcat LIKE LINE OF it_fcat .
SELECT-OPTIONS: s_carrid FOR spfli-carrid.

START-OF-SELECTION .
  PERFORM get_data .
  PERFORM create_fcat.
  PERFORM disp_alv .

FORM get_data .
  SELECT carrid connid countryfr cityfrom FROM spfli
      INTO TABLE it_spfli
      WHERE carrid IN s_carrid.
ENDFORM.                    " GET_DATA

FORM create_fcat .
  wa_fcat-col_pos = '1' .
  wa_fcat-fieldname = 'CONNID' .
  wa_fcat-seltext_m = 'Flight Number' .
  wa_fcat-hotspot = 'X' .
  APPEND wa_fcat TO it_fcat .
  CLEAR wa_fcat .

  wa_fcat-col_pos = '2' .
  wa_fcat-fieldname = 'CARRID' . "Field Name of the DB table
  wa_fcat-seltext_m = 'Airline' . "Col Heading to be displayed
  APPEND wa_fcat TO it_fcat .
  CLEAR wa_fcat .

  wa_fcat-col_pos = '3' .
  wa_fcat-fieldname = 'COUNTRYFR' .
* wa_fcat-no_out = 'X' .  "whether to display in output or not
  wa_fcat-seltext_m = 'Country From' .
  wa_fcat-edit = 'X' .
  APPEND wa_fcat TO it_fcat .
  CLEAR wa_fcat .

  wa_fcat-col_pos = '4' .
  wa_fcat-fieldname = 'CITYFROM' .
  wa_fcat-seltext_m = 'Departure City' .
  wa_fcat-emphasize = 'C610'.  "C610 - red, C510- green " refer to the excel sheet for more colors.
  APPEND wa_fcat TO it_fcat .
  CLEAR wa_fcat .
ENDFORM.                    " CREATE_FCAT

FORM disp_alv .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      it_fieldcat = it_fcat "PASS FIELD CATALOG TO ALV
    TABLES
      t_outtab    = it_spfli.
ENDFORM.                    " DISP_ALV