*CREATE_FOR_CDS_VIEW is a static method of the class CL_SALV_GUI_TABLE_IDA
*If the parameters of the create method are observed, it is seen
*that it has a Returning parameter RO_ALV_GUI_TABLE_IDA
*RO_ALV_GUI_TABLE_IDA IS OF TYPE IF_SALV_GUI_TABLE_IDA.
*IF_SALV_GUI_TABLE_IDA IS AN INTERFACE WHICH HAS THE METHOD FULLSCREEN.
*METHOD FULLSCREEN RETURNS OBJECT OF TYPE IF_SALV_GUI_FULLSCREEN_IDA
*IF_SALV_GUI_FULLSCREEN_IDA IS AN INTERFACE WHICH HAS THE METHOD DISPLAY.

REPORT z.


DATA(LO_ALV) = CL_SALV_GUI_TABLE_IDA=>CREATE_FOR_CDS_VIEW( IV_CDS_VIEW_NAME =  'ZVK1_CDS_EMP' ).

"DATA(O_Fulscr) = LO_ALV->FULLSCREEN( ).

"O_Fulscr->DISPLAY( ).

LO_ALV->FULLSCREEN( )->DISPLAY( ).

_______________________________________________________________________

REPORT Z.
CL_SALV_GUI_TABLE_IDA=>CREATE_FOR_CDS_VIEW(
  EXPORTING
    IV_CDS_VIEW_NAME               = 'ZVK_CDS_EMP'
*    io_gui_container               =
*    io_calc_field_handler          =
  RECEIVING
    RO_ALV_GUI_TABLE_IDA           = DATA(O_ALV)
).
*  CATCH cx_salv_db_connection.    "
*  CATCH cx_salv_db_table_not_supported.    "
*  CATCH cx_salv_ida_contract_violation.    "
*  CATCH cx_salv_function_not_supported.    "

DATA(O_FULLSCREEN) = O_ALV->FULLSCREEN( ).
*  CATCH cx_salv_ida_contract_violation.    "

O_FULLSCREEN->DISPLAY( ).

========================USING CHAINING METHOD================================

REPORT Z.
CL_SALV_GUI_TABLE_IDA=>CREATE_FOR_CDS_VIEW(
  EXPORTING
    IV_CDS_VIEW_NAME        = 'ZVK_CDS_EMP'
)->FULLSCREEN( )->DISPLAY( ).
*  CATCH cx_salv_ida_contract_violation. " .


