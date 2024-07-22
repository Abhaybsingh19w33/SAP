*
REPORT Z.
DATA orf_1 TYPE REF TO cx_root.
TYPES: BEGIN OF TY_EMP,
         EMPNO  TYPE Z104329EMP-EMPNO,
         ENAME  TYPE Z104329EMP-ENAME,
         SAL    TYPE Z104329EMP-SAL,
         DEPTNO TYPE Z104329EMP-DEPTNO,
         DNAME  TYPE Z104329DEPT-DNAME,
         LOC    TYPE Z104329DEPT-LOC,
       END OF TY_EMP.
DATA : WA_EMP TYPE TY_EMP,
       IT_EMP TYPE TABLE OF TY_EMP.

DATA: O_CONN   TYPE REF TO CL_SQL_CONNECTION,
      O_SQL    TYPE REF TO CL_SQL_STATEMENT,
      O_RESULT TYPE REF TO CL_SQL_RESULT_SET,
      V_SQL    TYPE STRING,
      O_DATA   TYPE REF TO DATA,
      V_COUNT  TYPE I.


"it_partner is the table type of the output that you want
"to display.
"Reference variables like this can point to any data objects.
GET REFERENCE OF IT_EMP INTO O_DATA.
"create a reference to data

TRY.
*Connect to the respective DB according connection
"CALL METHOD CL_SQL_CONNECTION=>GET_CONNECTION
*  EXPORTING
*    con_name = 'MT_HDB'
*    sharable = SPACE
"  RECEIVING
"    CON_REF = O_CONN.
.
"Pass the connection object to the sql object
CREATE OBJECT O_SQL.
"  EXPORTING
"    CON_REF = O_CONN.

"Create the VSQL
V_SQL = |SELECT E.Empno ,E.Ename, E.Sal, E.Deptno, D.Dname, D.Loc  FROM z104329emp  E INNER JOIN| &&
        | Z104329DEPT D on E.Deptno = D.Deptno |.


CALL METHOD O_SQL->EXECUTE_QUERY
  EXPORTING
    STATEMENT  = V_SQL
*   hold_cursor = SPACE
  RECEIVING
    RESULT_SET = O_RESULT.

" SET_PARAM_TABLE SAP Method - Sets internal table as input parameter
CALL METHOD O_RESULT->SET_PARAM_TABLE
  EXPORTING
    ITAB_REF = O_DATA.
*Data Records into internal table
"Using the method NEXT_PACKAGE, all the rows of the result set are transported into the internal table.

CALL METHOD O_RESULT->NEXT_PACKAGE
*  EXPORTING
*    upto     = 0
  RECEIVING
    ROWS_RET = V_COUNT.  "Rows_ret is a Mandatory field


WRITE V_COUNT.

CATCH CX_SQL_EXCEPTION INTO orf_1.
  WRITE 'EXCEPTION OCCURED'.

ENDTRY.

"Class used to display out
CL_DEMO_OUTPUT=>DISPLAY( IT_EMP ).