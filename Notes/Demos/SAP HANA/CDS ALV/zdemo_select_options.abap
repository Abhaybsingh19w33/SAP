*&---------------------------------------------------------------------*
*& Report zdemo_select_options
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdemo_select_options.

TABLES ekko.
SELECT-OPTIONS s_ebeln FOR ekko-ebeln.

START-OF-SELECTION.
* Create object reference ALV with IDA
* CL_SALV_GUI_TABLE_IDA class has method CREATE which returns RO_ALV_GUI_TABLE_IDA.
* RO_ALV_GUI_TABLE_IDA is of type IF_SALV_GUI_TABLE_IDA.

* this will create the IDA from table
*  DATA(lo_alv) = cl_salv_gui_table_ida=>create( iv_table_name = 'SCARR' ).

* this will create the IDA from CDS view
  DATA(lo_alv) = cl_salv_gui_table_ida=>create_for_cds_view( 'ZDEMO_CDS_PURCHASE_HEADER' ).

* Build range tables
  DATA(lo_range_collector) = NEW cl_salv_range_tab_collector( ).

* CL_SALV_RANGE_TAB_COLLECTOR is a class which has the method ADD_RANGES_FOR_NAME
* ADD_RANGES_FOR_NAME has an Importing parameter IV_NAME
* IV_NAME is of type string
* ADD_RANGES_FOR_NAME has an Importing parameter IT_RANGES
* IT_RANGES is an Internal table (ANY TABLE) type
  lo_range_collector->add_ranges_for_name( iv_name = 'Purchasing_Document_Number'
                                           it_ranges = s_ebeln[] ).

* CL_SALV_RANGE_TAB_COLLECTOR is a class which has the method GET_COLLECTED_RANGES
* GET_COLLECTED_RANGES has Exporting parameter with name ET_NAMED_RANGES
* ET_NAMED_RANGES is of type IF_SALV_SERVICE_TYPES=>YT_NAMED_RANGES
  DATA lt_select_options TYPE if_salv_service_types=>yt_named_ranges.

  lo_range_collector->get_collected_ranges( IMPORTING et_named_ranges = lt_select_options ).

* Set select options
* IF_SALV_GUI_TABLE_IDA has method SET_SELECT_OPTIONS.
* SET_SELECT_OPTIONS has parameter IT_RANGES
* IT_RANGES has an IMPORTING PARAMETER of TYPE IF_SALV_SERVICE_TYPES=>YT_NAMED_RANGES
* IF_SALV_SERVICE_TYPES is an interface which has the type YT_NAMED_RANGES
  lo_alv->set_select_options( it_ranges = lt_select_options ).

* IF_SALV_GUI_TABLE_IDA has method FULLSCREEN.
  lo_alv->fullscreen( )->display( ).