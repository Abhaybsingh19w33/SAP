REPORT Z.
*CREATE_FOR_CDS_VIEW is a static method of the class CL_SALV_GUI_TABLE_IDA
*If the parameters of the create method are observed, it is seen
*that it has a Returning parameter RO_ALV_GUI_TABLE_IDA
*RO_ALV_GUI_TABLE_IDA IS OF TYPE IF_SALV_GUI_TABLE_IDA.
*IF_SALV_GUI_TABLE_IDA IS AN INTERFACE WHICH HAS THE METHOD FULLSCREEN.
*METHOD FULLSCREEN RETURNS OBJECT OF TYPE IF_SALV_GUI_FULLSCREEN_IDA

*IF_SALV_GUI_TABLE_IDA IS AN INTERFACE WHICH HAS THE METHOD FIELD_CATALOG.
*METHOD FIELD_CATALOG RETURNS AN OBJECT OF RO_FIELD_CATALOG
*RO_FIELD_CATALOG IS OF TYPE IF_SALV_GUI_FIELD_CATALOG_IDA
*i.e METHOD FIELD_CATALOG RETURNS AN OBJECT OF TYPE IF_SALV_GUI_FIELD_CATALOG_IDA
* IF_SALV_GUI_FIELD_CATALOG_IDA HAS THE METHOD SET_FIELD_HEADER_TEXTS
*IF_SALV_GUI_FULLSCREEN_IDA IS AN INTERFACE WHICH HAS THE METHOD DISPLAY.



CL_SALV_GUI_TABLE_IDA=>CREATE_FOR_CDS_VIEW(
  EXPORTING
    IV_CDS_VIEW_NAME               = 'ZVK_CDS2_EMP'
*    io_gui_container               =
*    io_calc_field_handler          =
  RECEIVING
    RO_ALV_GUI_TABLE_IDA           = DATA(O_ALV)
).


*  CATCH cx_salv_db_connection.    "
*  CATCH cx_salv_db_table_not_supported.    "
*  CATCH cx_salv_ida_contract_violation.    "
*  CATCH cx_salv_function_not_supported.    " _

DATA(O_FUL_SCRN) = O_ALV->FULLSCREEN( ).
*  CATCH cx_salv_ida_contract_violation.    "

DATA(O_FCAT) = O_ALV->FIELD_CATALOG( ).
**

O_FCAT->SET_FIELD_HEADER_TEXTS(
  EXPORTING
    IV_FIELD_NAME                  = 'EMPNO'
    IV_HEADER_TEXT                 = 'Employee Num'
    IV_TOOLTIP_TEXT                = 'This is emp no'
    IV_TOOLTIP_TEXT_LONG           = 'This is emp no field'
).

O_FCAT->SET_FIELD_HEADER_TEXTS(
  EXPORTING
    IV_FIELD_NAME                  = 'ENAME'
    IV_HEADER_TEXT                 = 'Employee Name'
*     IV_TOOLTIP_TEXT                =
*     IV_TOOLTIP_TEXT_LONG           =
).

O_FCAT->SET_FIELD_HEADER_TEXTS(
  EXPORTING
    IV_FIELD_NAME                  = 'SAL'
    IV_HEADER_TEXT                 = 'Salary').

O_FCAT->SET_FIELD_HEADER_TEXTS(
  EXPORTING
    IV_FIELD_NAME                  = 'DEPTNO'
    IV_HEADER_TEXT                 = 'Department Num').

O_FCAT->SET_FIELD_HEADER_TEXTS(
  EXPORTING
    IV_FIELD_NAME                  = 'JOB'
    IV_HEADER_TEXT                 = 'Job Details').

O_FCAT->SET_FIELD_HEADER_TEXTS(
  EXPORTING
    IV_FIELD_NAME                  = 'MGR'
    IV_HEADER_TEXT                 = 'Manager Empno').

O_FCAT->SET_FIELD_HEADER_TEXTS(
  EXPORTING
    IV_FIELD_NAME                  = 'HIREDATE'
    IV_HEADER_TEXT                 = 'Date of Join').

**   CATCH CX_SALV_IDA_UNKNOWN_NAME.    "
**   CATCH CX_SALV_CALL_AFTER_1ST_DISPLAY.    "
*


O_FUL_SCRN->DISPLAY( ).