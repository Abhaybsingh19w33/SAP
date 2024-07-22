


REPORT Z.

DATA IT_PARTNER TYPE TABLE OF Z104329DEPT.
DATA WA_PARTNER TYPE Z104329DEPT.


DATA: O_CONN   TYPE REF TO CL_SQL_CONNECTION,
      O_SQL    TYPE REF TO CL_SQL_STATEMENT,
      O_RESULT TYPE REF TO CL_SQL_RESULT_SET,
      V_SQL    TYPE STRING,
      O_DATA   TYPE REF TO DATA,
      V_COUNT  TYPE I.


"it_partner is the table type of the output that you want to display.
"Reference variables like this can point to any data objects.


TRY.
*Connect to the respective DB according connection
CALL METHOD CL_SQL_CONNECTION=>GET_CONNECTION
*  EXPORTING
*    con_name = 'MT_HDB'
*    con_name = ''
*    sharable = SPACE
  RECEIVING
    CON_REF = O_CONN."O_CONN POINTS TO SEC DB

    .
"Pass the connection object to the sql object
CREATE OBJECT O_SQL
  EXPORTING
    CON_REF = O_CONN.



"Create the VSQL

V_SQL = | SELECT * FROM Z104329DEPT|.

"V_SQL = | SELECT * FROM TRAINEE06.VKDEPT|.


"V_SQL = | SELECT KUNNR,VBELN,NETPR FROM TRAINEE06.ZADM_SALES|.
*V_SQL = |select kunnr,'I' as CustType from TRAINEE01.GT_18|.
*V_SQL = |SELECT kunnr,name1,'I' as CustType FROM ZMT_KNA1 UNION | &&
*        |SELECT kunnr,name1,'E' as CustType FROM ZMT_EX_KNA1  |.



CALL METHOD O_SQL->EXECUTE_QUERY
  EXPORTING
    STATEMENT  = V_SQL
*   hold_cursor = SPACE
  RECEIVING
    RESULT_SET = O_RESULT.

"GET REFERENCE OF IT_PARTNER INTO O_DATA.

" SET_PARAM_TABLE SAP Method - Sets internal table as input parameter
CALL METHOD O_RESULT->SET_PARAM_TABLE
  EXPORTING
    ITAB_REF = O_DATA.

*Data Records into internal table
"Using the method NEXT_PACKAGE, all the rows of the result set are transported into the internal table.

CALL METHOD O_RESULT->NEXT_PACKAGE
**  EXPORTING
**    upto     = 0
  RECEIVING
    ROWS_RET = V_COUNT.  "Rows_ret is a Mandatory field

ENDTRY.

"Class used to display output
CL_DEMO_OUTPUT=>DISPLAY( IT_PARTNER ).