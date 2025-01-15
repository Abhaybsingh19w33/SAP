"Add button
REPORT Z.
CL_SALV_GUI_TABLE_IDA=>CREATE_FOR_CDS_VIEW(
  EXPORTING
    IV_CDS_VIEW_NAME               = 'ZVK_CDS2_EMP'
*    io_gui_container               =
*    io_calc_field_handler          =
  RECEIVING
    RO_ALV_GUI_TABLE_IDA           = DATA(O_ALV)
).


O_ALV->TOOLBAR( )->ADD_BUTTON(
  EXPORTING
    IV_FCODE         = 'DETAIL'
    IV_TEXT          = 'Detailed'
    IV_QUICKINFO     = 'Demo: Emp Details'
    IV_BEFORE_STANDARD_FUNCTIONS = ABAP_FALSE
).

DATA(O_FUL_SCRN) = O_ALV->FULLSCREEN( ).
O_FUL_SCRN->DISPLAY( ).