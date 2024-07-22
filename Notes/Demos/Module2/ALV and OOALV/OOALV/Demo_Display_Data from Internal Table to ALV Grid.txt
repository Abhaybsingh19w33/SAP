REPORT z.
TYPES: BEGIN OF tyscarr,
         carrid   TYPE scarr-carrid,
         carrname TYPE scarr-carrname,
       END OF tyscarr.

DATA it_scarr TYPE TABLE OF tyscarr.
DATA wascarr TYPE tyscarr.
DATA: r_container TYPE REF TO cl_gui_custom_container,
      r_grid      TYPE REF TO cl_gui_alv_grid,
      it_fcat     TYPE lvc_t_fcat,
      wa_fcat     TYPE lvc_s_fcat.
DATA : wa_layout TYPE lvc_s_layo.

wascarr-carrid = 'AA'.
wascarr-carrname = 'Americal Airlines'.
APPEND wascarr TO it_scarr.

wascarr-carrid = 'AB'.
wascarr-carrname = 'AirBerlin'.
APPEND wascarr TO it_scarr.

CALL SCREEN 100.

MODULE list OUTPUT.
  CREATE OBJECT r_container
    EXPORTING
      container_name = 'CONTAINER'.

  CREATE OBJECT r_grid
    EXPORTING
      i_parent = r_container.

  wa_layout-grid_title = 'ALV Grid Title'.
  "wa_layout-zebra = 'X'.
  wa_layout-smalltitle = 'X'.
  wa_layout-cwidth_opt = 'X'.

  wa_fcat-col_pos = '1' .
  wa_fcat-fieldname = 'carrid ' .
  wa_fcat-ref_field = 'carrid ' .
  wa_fcat-tabname = 'IT_SCARR'. 
  "wa_fcat-ref_table = 'SPFLI'.
  APPEND wa_fcat TO it_fcat .
  CLEAR wa_fcat .

  wa_fcat-col_pos = '2' .
  wa_fcat-fieldname = 'CARRNAME' .
  APPEND wa_fcat TO it_fcat .
  CLEAR wa_fcat .


  CALL METHOD r_grid->set_table_for_first_display
    EXPORTING
      is_layout       = wa_layout
    CHANGING
      it_fieldcatalog = it_fcat
      it_outtab       = it_scarr.
ENDMODULE.


MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
  ENDCASE.
ENDMODULE.