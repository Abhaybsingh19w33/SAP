*&---------------------------------------------------------------------*
*& Report zdemo_cds_with_alv
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdemo_cds_with_alv.

TRY.
    cl_salv_gui_table_ida=>create_for_cds_view(
      EXPORTING
        iv_cds_view_name               = 'ZDEMO_CDS_PURCHASE_HEADER'
*    io_gui_container               =
*    io_calc_field_handler          =
      RECEIVING
        ro_alv_gui_table_ida           = DATA(o_alv)
    ).
  CATCH cx_salv_db_connection.
    MESSAGE 'DB connection failed' TYPE 'E'.
  CATCH cx_salv_db_table_not_supported.
    MESSAGE 'DB connection failed' TYPE 'E'.
  CATCH cx_salv_ida_contract_violation.
    MESSAGE 'IDA contract violation' TYPE 'E'.
  CATCH cx_salv_function_not_supported.
    MESSAGE 'Function not supported' TYPE 'E'.
ENDTRY.

* IF_SALV_GUI_TABLE_IDA is an interface which has the method display options
* display options returns an with the name RO_DISPLAY_OPTIONS
* RO_DISPLAY_OPTIONS IS OF TYPE IF_SALV_GUI_TABLE_DISPLAY_OPT
* To set title
o_alv->display_options( )->set_title( iv_title = 'Purchase Header Data' ).

* IF_SALV_GUI_TABLE_DISPLAY_OPT is an interface which has method SET_TITLE
* it also has the method ENABLE_ALTERNATING_ROW_PATTERN
" Zebra layout
o_alv->display_options( )->enable_alternating_row_pattern( ).

o_alv->default_layout( )->set_sort_order(
                            VALUE #( ( field_name = 'PURCHASING_DOCUMENT_NUMBER'
*                                       is_grouped = abap_true
                                       descending = abap_false
                                   ) ) ).

* IF_SALV_GUI_TABLE_IDA is an interface which has the method FIELD_CATALOG.
* METHOD FIELD_CATALOG returns an object of with the name RO_FIELD_CATALOG
* RO_FIELD_CATALOG IS OF TYPE IF_SALV_GUI_FIELD_CATALOG_IDA
* METHOD FIELD_CATALOG returns an object of type IF_SALV_GUI_FIELD_CATALOG_IDA
DATA(o_fcat) = o_alv->field_catalog( ).

* IF_SALV_GUI_FIELD_CATALOG_IDA has the method GET_AVAILABLE_FIELDS
o_fcat->get_available_fields(
  IMPORTING
    ets_field_names = DATA(it_fields)
).

* Delete one field
* though the view has this field will still not appear in the ALV
DELETE it_fields WHERE table_line = 'ITEM_NUMBER_INTERVAL'.

o_fcat->disable_aggregation( iv_field_name = 'LAST_ITEM_NUMBER' ).

"Disabling sorting, ascending and descending for priority field right click)
o_fcat->disable_sort( iv_field_name = 'PURCHASING_DOCUMENT_CATEGORY').
o_fcat->disable_filter( iv_field_name = 'PURCHASING_DOCUMENT_TYPE').

* IF_SALV_GUI_FIELD_CATALOG_IDA has the method SET_AVAILABLE_FIELDS
o_fcat->set_available_fields( its_field_names = it_fields ).

* IF_SALV_GUI_FIELD_CATALOG_IDA HAS THE METHOD SET_FIELD_HEADER_TEXTS
o_fcat->set_field_header_texts(
  EXPORTING
    iv_field_name                  = 'PURCHASING_DOCUMENT_NUMBER'
    iv_header_text                 = 'Purchase Doc No'
    iv_tooltip_text                = 'Purchase Document No'
    iv_tooltip_text_long           = 'Purchasing Document Number'
).

" To remove print and aggregation button from the custom ALV toolbar
o_alv->standard_functions( )->set_print_active( iv_active = abap_false ).
o_alv->standard_functions( )->set_aggregation_active( iv_active = abap_false ).

"Add button
o_alv->toolbar( )->add_button(
  EXPORTING
    iv_fcode         = 'DETAIL'
    iv_text          = 'Detailed'
    iv_quickinfo     = 'Demo: Emp Details'
    iv_before_standard_functions = abap_false
).

*IF_SALV_GUI_TABLE_IDA is an interface which has the method FULLSCREEN.
*METHOD FULLSCREEN RETURNS OBJECT OF TYPE IF_SALV_GUI_FULLSCREEN_IDA
TRY.
    DATA(o_ful_scrn) = o_alv->fullscreen( ).
  CATCH cx_salv_ida_contract_violation.
    MESSAGE 'IDA contract violation' TYPE 'E'.
ENDTRY.

* IF_SALV_GUI_FULLSCREEN_IDA is an interface which has the method DISPLAY.
o_ful_scrn->display( ).

*&---------------------------------------------------------------------*
* chaining Method
*&---------------------------------------------------------------------*
*cl_salv_gui_table_ida=>create_for_cds_view(
*  EXPORTING
*    iv_cds_view_name        = 'ZDEMO_CDS_PURCHASE_HEADER'
*)->fullscreen( )->display( ).
*&---------------------------------------------------------------------*