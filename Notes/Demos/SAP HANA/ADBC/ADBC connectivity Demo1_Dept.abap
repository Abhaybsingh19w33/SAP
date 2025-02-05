*GET_CONNECTION IS A STATIC METHOD OF CLASS CL_SQL_CONNECTION
*IT HAS importing parameter CON_NAME which is of type DBCON_NAME
*IT has returning parameter CON_REF which if of type CL_SQL_CONNECTION

REPORT Z.
DATA ORF_1 TYPE REF TO CX_ROOT.
DATA: WA_DEPT TYPE Z104329DEPT,
      IT_DEPT TYPE TABLE OF Z104329DEPT.

DATA: O_CONN   TYPE REF TO CL_SQL_CONNECTION,
      O_SQL    TYPE REF TO CL_SQL_STATEMENT,
      O_RESULT TYPE REF TO CL_SQL_RESULT_SET,
      V_SQL    TYPE STRING,
      O_DATA   TYPE REF TO DATA,
      V_COUNT  TYPE I.

TRY.
*Connect to the respective DB according connection
" O_CONN = CL_SQL_CONNECTION=>GET_CONNECTION( 'MT_HDB').
  O_CONN = CL_SQL_CONNECTION=>GET_CONNECTION( ).
.
"Pass the connection object to the sql object
CREATE OBJECT O_SQL
  EXPORTING
    CON_REF = O_CONN.

O_RESULT = O_SQL->EXECUTE_QUERY('SELECT * FROM z104329DEPT').

"Create the VSQL
"V_SQL = 'SELECT * FROM z104329DEPT'.
"O_RESULT = O_SQL->EXECUTE_QUERY( V_SQL ).

"it_dept is the table type of the output that you want
"to display.
"Reference variables like this can point to any data objects.

GET REFERENCE OF IT_DEPT INTO O_DATA.
"create a reference to data

" SET_PARAM_TABLE SAP Method - Sets internal table as input parameter
O_RESULT->SET_PARAM_TABLE( O_DATA ).
"O_RESULT->SET_PARAM_TABLE( ITAB_REF = O_DATA ).
*Data Records into internal table

"Using the method NEXT_PACKAGE,
*all the rows of the result set
*are transported into the internal table.

O_RESULT->NEXT_PACKAGE( ).

*V_COUNT = O_RESULT->NEXT_PACKAGE( ).
*WRITE V_COUNT.

CATCH CX_SQL_EXCEPTION INTO ORF_1.
  WRITE 'EXCEPTION OCCURED'.
  WRITE: / 'Text is:', ORF_1->GET_TEXT( ).
  WRITE: / 'Long Text is:', ORF_1->GET_LONGTEXT( ).
ENDTRY.

"Class used to display out
CL_DEMO_OUTPUT=>DISPLAY( IT_DEPT ).