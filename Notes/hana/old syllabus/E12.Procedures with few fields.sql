*&---------------------------------------------------------------------*
*& Report ZADM_GET_BUS_SALESS1
*&---------------------------------------------------------------------*
*&1) create the procedure, with table type.
2)Go to second tab LOCAL TABLE TYPE CODE   and add the table type
3)Test the procedure in modeller view 
4) write se38  adbc program and change the v_Sql
==============================================================================================
1)PROCEDDURE CODE 

CREATE PROCEDURE GET_SALES_TR1 ( OUT RES_TAB  TT_SALES ) 
	LANGUAGE SQLSCRIPT
	SQL SECURITY INVOKER 
	--DEFAULT SCHEMA <default_schema_name>
	READS SQL DATA AS
BEGIN
/***************************** 
	Write your procedure logic 
 *****************************/
 res_tab = select KUNNR, SUM(NETPR) AS NETPR  from sapls4.zadm_sales GROUP BY KUNNR

                            ;
END;
===========================================================================
2)In the procedure , go to second tab LOCAL TABLE TYPE CODE  
Add the below code

CREATE TYPE TT_SALES AS TABLE ( KUNNR NVARCHAR(10), NETPR DECIMAL(13,2) ); 


===========================================================================
3)  test the procedure in Modler perspective
4)se38 program
*&---------------------------------------------------------------------*

REPORT ZADM_GET_BUS_SALESS1.
TYPES : BEGIN OF TY_SALES,
          KUNNR TYPE KUNNR,
          NETPR TYPE BPREI,
        END   OF TY_SALES.
data : wa_SALES type TY_SALES,
       it_SALES type TABLE OF TY_SALES.

 DATA: O_conn   type REF TO cl_sql_connection,
       o_sql    type REF TO cl_sql_statement,
       o_result type REF TO cl_sql_result_set,
       V_SQL    TYPE STRING,
       o_data   type REF TO data.

*TRY.
*Connect to the respective DB according connection
CALL METHOD cl_sql_connection=>get_connection
*  EXPORTING
*    con_name = 'ADM_HDB'
*    sharable = SPACE
  RECEIVING
    con_ref  = O_CONN
    .
* CATCH cx_sql_exception .
*ENDTRY.

CREATE OBJECT o_sql
  EXPORTING
    con_ref = O_CONN
*    tab_name_for_trace =
    .



*V_SQL =  | CALL "_SYS_BIC"."pkg-trainee01/ADM1_GET_SALES_BY_CUS"(null ) | .
V_SQL =  | CALL "_SYS_BIC"."pkg-trainee01/GET_SALES_TR1"(null ) | .
*union| &&
*        |SELECT kunnr,name1,'E' as type FROM ZADM_EX_KNA1|.


*TRY.
CALL METHOD o_sql->execute_query
  EXPORTING
    statement   = V_SQL
*    hold_cursor = SPACE
  RECEIVING
    result_set  = O_RESULT
    .
* CATCH cx_sql_exception .
* CATCH cx_parameter_invalid .
*ENDTRY.

get REFERENCE OF it_SALES into o_data.
*TRY.
CALL METHOD o_result->set_param_table
  EXPORTING
    itab_ref             = o_data
*    corresponding_fields =
*    lob_fields           =
    .
* CATCH cx_parameter_invalid .
*ENDTRY.

data v_count type i.
*Data Records into internal table
*TRY.
CALL METHOD o_result->next_package
*  EXPORTING
*    upto     = 0
  RECEIVING
    rows_ret = v_count
    .
* CATCH cx_sql_exception .
* CATCH cx_parameter_invalid_type .
*ENDTRY.

cl_demo_output=>display( it_SALES ).