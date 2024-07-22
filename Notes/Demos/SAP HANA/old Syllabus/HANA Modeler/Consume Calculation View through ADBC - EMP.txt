REPORT Z.

TYPES : BEGIN OF TY_EMP,
          SAL TYPE Z104329EMP-SAL,
        END   OF TY_emp.

DATA : WA_EMP TYPE TY_EMP,
       IT_EMP TYPE TABLE OF TY_EMP.

DATA: O_CONN   TYPE REF TO CL_SQL_CONNECTION,
      O_SQL    TYPE REF TO CL_SQL_STATEMENT,
      O_RESULT TYPE REF TO CL_SQL_RESULT_SET,
      V_SQL    TYPE STRING,
      O_DATA   TYPE REF TO DATA.

*TRY.
*Connect to the respective DB according connection
CALL METHOD CL_SQL_CONNECTION=>GET_CONNECTION
*  EXPORTING
*    con_name = 'ADM_HDB'
*    sharable = SPACE
  RECEIVING
    CON_REF = O_CONN.
* CATCH cx_sql_exception .
*ENDTRY.

CREATE OBJECT O_SQL
  EXPORTING
    CON_REF = O_CONN.

V_SQL =  | SELECT * FROM  "_SYS_BIC"."pkg-trainee01/ZVK_CALC_VIEW" | .

*TRY.
CALL METHOD O_SQL->EXECUTE_QUERY
  EXPORTING
    STATEMENT  = V_SQL
*   hold_cursor = SPACE
  RECEIVING
    RESULT_SET = O_RESULT.
* CATCH cx_sql_exception .
* CATCH cx_parameter_invalid .
*ENDTRY.

GET REFERENCE OF IT_EMP INTO O_DATA.
*TRY.
CALL METHOD O_RESULT->SET_PARAM_TABLE
  EXPORTING
    ITAB_REF = O_DATA
*   corresponding_fields =
*   lob_fields           =
  .
* CATCH cx_parameter_invalid .
*ENDTRY.

DATA V_COUNT TYPE I.
*Data Records into internal table
*TRY.
CALL METHOD O_RESULT->NEXT_PACKAGE
*  EXPORTING
*    upto     = 0
  RECEIVING
    ROWS_RET = V_COUNT.
* CATCH cx_sql_exception .
* CATCH cx_parameter_invalid_type .
*ENDTRY.

CL_DEMO_OUTPUT=>DISPLAY( IT_EMP ).