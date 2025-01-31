REPORT ZAT_ALV_DEMO02.
" =====================================
" "In this program instead of passing  structure name directly to the FM, we will pass the fieldcatalog to it_fieldcat.

" Instead of I_STRUCTURE_NAME =  'SPFLI',
"  we will pass it_fieldcat= it_fcat[].
" ==================================================
TABLES spfli.
TYPE-POOLS slis .

DATA : it_spfli TYPE TABLE OF spfli .
DATA : it_fcat TYPE slis_t_fieldcat_alv .
SELECT-OPTIONS: s_carrid FOR spfli-carrid.

START-OF-SELECTION .
  PERFORM get_data .
  PERFORM create_fcat.
  PERFORM disp_alv .

FORM get_data .
  SELECT * FROM spfli
      INTO TABLE it_spfli
      WHERE carrid IN s_carrid.
ENDFORM.                    " GET_DATA

FORM create_fcat.
  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name = 'SPFLI'
    CHANGING
      ct_fieldcat      = it_fcat[].
ENDFORM.

" CREATE_FCAT
FORM disp_alv .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      it_fieldcat = it_fcat "PASS FIELD CATALOG TO ALV
    TABLES
      t_outtab    = it_spfli.
ENDFORM.                    " DISP_ALV