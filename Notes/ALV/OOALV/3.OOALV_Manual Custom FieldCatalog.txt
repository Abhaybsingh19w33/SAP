REPORT ZAT_OOALV_DEMO03.



TYPES : BEGIN OF ty_spfli,  "User defined internal table type

          carrid    TYPE spfli-carrid,
          connid    TYPE spfli-connid,
          countryfr TYPE spfli-countryfr,
          cityfrom  TYPE spfli-cityfrom,
        END OF ty_spfli.
DATA:
  it_spfli    TYPE TABLE OF ty_spfli,
  r_container TYPE REF TO cl_gui_custom_container,
  r_grid      TYPE REF TO cl_gui_alv_grid,
  it_fcat     TYPE lvc_t_fcat,
  wa_fcat     TYPE lvc_s_fcat.

DATA : wa_layout TYPE lvc_s_layo.

SELECT carrid connid countryfr cityfrom FROM spfli
      INTO TABLE it_spfli.

CALL SCREEN 100.

MODULE list OUTPUT.
  CREATE OBJECT r_container
    EXPORTING
      container_name = 'CONTAINER'.

  CREATE OBJECT r_grid
    EXPORTING
      i_parent = r_container.

  wa_layout-grid_title = 'ALV Grid Title'.
  wa_layout-zebra = 'X'.
  wa_layout-cwidth_opt = 'X'.

  wa_fcat-col_pos = '1' .
  wa_fcat-fieldname = 'CARRID' . "Field Name of the DB table
  wa_fcat-ref_table = 'SPFLI' .
  APPEND wa_fcat TO it_fcat .
  CLEAR wa_fcat .

  wa_fcat-col_pos = '2' .
  wa_fcat-fieldname = 'CONNID' .
  wa_fcat-ref_table = 'SPFLI' .
  wa_fcat-hotspot = 'X' .
  APPEND wa_fcat TO it_fcat .
  CLEAR wa_fcat .

  wa_fcat-col_pos = '3' .
  wa_fcat-fieldname = 'COUNTRYFR'.
  wa_fcat-ref_table = 'SPFLI' .
  wa_fcat-seltext = 'Country From' .
  APPEND wa_fcat TO it_fcat .
  CLEAR wa_fcat .

  wa_fcat-col_pos = '4' .
  wa_fcat-fieldname = 'CITYFROM' .
  wa_fcat-ref_table = 'SPFLI' .
  wa_fcat-emphasize = 'C610'.
  APPEND wa_fcat TO it_fcat .
  CLEAR wa_fcat .

  CALL METHOD r_grid->set_table_for_first_display
    EXPORTING
      is_layout       = wa_layout
    CHANGING
      it_fieldcatalog = it_fcat
      it_outtab       = it_spfli.
ENDMODULE.


MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
  ENDCASE.
ENDMODULE.