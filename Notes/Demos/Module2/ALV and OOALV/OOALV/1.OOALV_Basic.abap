REPORT ZAT_OOALV_DEMO01.

DATA : it_spfli TYPE TABLE OF spfli. "DECLARE INTERNAL TABLE FOR SPFLI
DATA:
  r_container TYPE REF TO cl_gui_custom_container,
  r_grid      TYPE REF TO cl_gui_alv_grid.

SELECT * FROM spfli INTO TABLE it_spfli.

CALL SCREEN 100.
*&---------------------------------------------------------------------

MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
  ENDCASE.
ENDMODULE.

*&---------------------------------------------------------------------
*& Module LIST OUTPUT
*&---------------------------------------------------------------------
*text
*----------------------------------------------------------------------
MODULE status_0100 OUTPUT.

  CREATE OBJECT r_container
    EXPORTING
      container_name = 'CONTAINER'.

  CREATE OBJECT r_grid
    EXPORTING
      i_parent = r_container.

  CALL METHOD r_grid->set_table_for_first_display
    EXPORTING
      i_structure_name = 'SPFLI'
    CHANGING
      it_outtab        = it_spfli. "PASS INTERNAL TABLE TO DISPLAY ALV FORMAT
ENDMODULE.