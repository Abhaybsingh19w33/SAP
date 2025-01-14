REPORT ZAT_OOALV_DEMO06.

TYPES : BEGIN OF ty_spfli,  "User defined internal table type
          carrid    TYPE spfli-carrid,
          connid    TYPE spfli-connid,
          countryfr TYPE spfli-countryfr,
          cityfrom  TYPE spfli-cityfrom,
        END OF ty_spfli.
DATA:
  it_spfli      TYPE TABLE OF ty_spfli,
  wa_spfli      LIKE LINE OF it_spfli,
  it_fcat_spfli TYPE lvc_t_fcat,
  wa_fcat_spfli TYPE lvc_s_fcat.

TYPES : BEGIN OF ty_sflight,
          carrid TYPE sflight-carrid,
          connid TYPE sflight-connid,
          fldate TYPE sflight-fldate,
          price  TYPE sflight-price,
        END OF ty_sflight.

DATA : it_sflight TYPE TABLE OF ty_sflight, "SFLIGHT internal table
       wa_sflight TYPE ty_sflight.
DATA : it_fcat_sflight TYPE lvc_t_fcat. "SFLIGHT field catalog
DATA : wa_fcat_sflight LIKE LINE OF it_fcat_sflight.


DATA: r_container  TYPE REF TO cl_gui_custom_container,
      r_container1 TYPE REF TO cl_gui_custom_container,
      r_grid       TYPE REF TO cl_gui_alv_grid,
      r_grid1      TYPE REF TO cl_gui_alv_grid.

CLASS lc_cls DEFINITION."  Local class calls the event of std class 
  PUBLIC SECTION.
    METHODS meth1 FOR EVENT double_click OF cl_gui_alv_grid
      IMPORTING e_row e_column.

ENDCLASS.

CLASS lc_cls IMPLEMENTATION.
  METHOD meth1.
    IF e_column-fieldname = 'CARRID'.
      PERFORM dispflightdet.
    ELSEIF e_column-fieldname = 'CONNID'.
      CALL TRANSACTION 'SE11'.
    ENDIF.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
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

  DATA obj1 TYPE REF TO lc_cls.
  CREATE OBJECT obj1.

  SET HANDLER obj1->meth1 FOR r_grid.

  PERFORM create_fcat_spfli.
  CALL METHOD r_grid->set_table_for_first_display
    CHANGING
      it_fieldcatalog = it_fcat_spfli
      it_outtab       = it_spfli.
ENDMODULE.


MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
  ENDCASE.
ENDMODULE.


FORM create_fcat_spfli.
  wa_fcat_spfli-col_pos = '1' .
  wa_fcat_spfli-fieldname = 'CARRID' . "Field Name of the DB table
  wa_fcat_spfli-ref_field = 'COUNTRYFR' .
  wa_fcat_spfli-ref_table = 'SPFLI' .
  wa_fcat_spfli-seltext = 'Airline' . "Col Heading to be displayed
  APPEND wa_fcat_spfli TO it_fcat_spfli .
  CLEAR wa_fcat_spfli .

  wa_fcat_spfli-col_pos = '2' .
  wa_fcat_spfli-fieldname = 'CONNID' .
  " WA_FCAT_SPFLI-TABNAME = 'IT_SPFLI' .
  wa_fcat_spfli-seltext = 'Flight Number' .
  APPEND wa_fcat_spfli TO it_fcat_spfli .
  CLEAR wa_fcat_spfli .

  wa_fcat_spfli-col_pos = '3' .
  wa_fcat_spfli-fieldname = 'COUNTRYFR' .
  wa_fcat_spfli-no_out = 'X' .
  wa_fcat_spfli-tabname = 'IT_SPFLI' .
  wa_fcat_spfli-seltext = 'Country From' .
*  WA_FCAT_SPFLI-EDIT = 'X' .
  APPEND wa_fcat_spfli TO it_fcat_spfli .
  CLEAR wa_fcat_spfli .

  wa_fcat_spfli-col_pos = '4' .
  wa_fcat_spfli-fieldname = 'CITYFROM' .
  wa_fcat_spfli-tabname = 'IT_SPFLI' .
  wa_fcat_spfli-seltext = 'Departure City' .
  wa_fcat_spfli-emphasize = 'C610'.
  APPEND wa_fcat_spfli TO it_fcat_spfli .
  CLEAR wa_fcat_spfli .

ENDFORM.

FORM dispflightdet.
  PERFORM get_data_sflight.
  PERFORM create_fcat_sflight.
  PERFORM disp_alv_sflight.
ENDFORM.


FORM get_data_sflight.
  SELECT  carrid connid
              fldate
              price FROM sflight INTO TABLE it_sflight.  "get flight data
  "    FOR ALL ENTRIES IN IT_SPFLI WHERE CARRID = IT_SPFLI-CARRID.
ENDFORM.

FORM create_fcat_sflight.
***build fcat for SFLIGHT
  wa_fcat_sflight-col_pos       = '1'.
  wa_fcat_sflight-fieldname     = 'CARRID'.
  wa_fcat_sflight-seltext = 'CARRID'.
  APPEND wa_fcat_sflight TO it_fcat_sflight.
  CLEAR wa_fcat_sflight.

  wa_fcat_sflight-col_pos       = '2'.
  wa_fcat_sflight-fieldname     = 'CONNID'.
  wa_fcat_sflight-seltext = 'CONNID'.
  APPEND wa_fcat_sflight TO it_fcat_sflight.
  CLEAR wa_fcat_sflight.

  wa_fcat_sflight-col_pos       = '3'.
  wa_fcat_sflight-fieldname     = 'FLDATE'.
  wa_fcat_sflight-seltext = 'Flight Date'.
  APPEND wa_fcat_sflight TO it_fcat_sflight.
  CLEAR wa_fcat_sflight.

  wa_fcat_sflight-col_pos       = '4'.
  wa_fcat_sflight-fieldname     = 'PRICE'.
  wa_fcat_sflight-seltext = 'Airfare'.
  APPEND wa_fcat_sflight TO it_fcat_sflight.
  CLEAR wa_fcat_sflight.


ENDFORM.

MODULE list1 OUTPUT.
  CREATE OBJECT r_container1
    EXPORTING
      container_name = 'CONTAINER1'.

  CREATE OBJECT r_grid1
    EXPORTING
      i_parent = r_container1.

  CALL METHOD r_grid1->set_table_for_first_display
    CHANGING
      it_fieldcatalog = it_fcat_sflight
      it_outtab       = it_sflight.
ENDMODULE.

MODULE user_command_0200 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
  ENDCASE.
ENDMODULE.

FORM disp_alv_sflight.
  CALL SCREEN 200.
ENDFORM.