*&---------------------------------------------------------------------*
*& Report zadbc_ekko
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zadbc_ekko.
*GET_CONNECTION IS A STATIC METHOD OF CLASS CL_SQL_CONNECTION
*IT HAS importing parameter CON_NAME which is of type DBCON_NAME
*IT has returning parameter CON_REF which if of type CL_SQL_CONNECTION

DATA orf_1 TYPE REF TO cx_root.
TYPES : BEGIN OF ty_ekko,
          ebeln TYPE ebeln,
          bukrs TYPE bukrs,
        END OF ty_ekko.

DATA: wa_ekko TYPE ty_ekko,
      it_ekko TYPE TABLE OF ty_ekko.

DATA: o_conn   TYPE REF TO cl_sql_connection,
      o_sql    TYPE REF TO cl_sql_statement,
      o_result TYPE REF TO cl_sql_result_set,
      v_sql    TYPE string,
      o_data   TYPE REF TO data,
      v_count  TYPE i.

TRY.
    "Connect to the respective DB according connection
    o_conn = cl_sql_connection=>get_connection( ).

    "Pass the connection object to the sql object
    CREATE OBJECT o_sql
      EXPORTING
        con_ref = o_conn.

    o_result = o_sql->execute_query('SELECT EBELN, BUKRS FROM EKKO').

    "create a reference to data
    "Reference variables like this can point to any data objects.
    GET REFERENCE OF it_ekko INTO o_data.

    " SET_PARAM_TABLE SAP Method - Sets internal table as input parameter
    o_result->set_param_table( o_data ).

    "Using the method NEXT_PACKAGE, all the rows of the result set
    "are transported into the internal table.
    o_result->next_package( ).

*    if records were found this function returns 0
*    v_count = o_result->next_package( ).
*    WRITE v_count.

    IF it_ekko IS NOT INITIAL.
      "WRITE : lines( it_ekko ).
      "Class used to display out
      cl_demo_output=>display( it_ekko ).
    ENDIF.

  CATCH cx_sql_exception INTO orf_1.
    WRITE 'EXCEPTION OCCURED'.
    WRITE: / 'Text is:', orf_1->get_text( ).
    WRITE: / 'Long Text is:', orf_1->get_longtext( ).

ENDTRY.