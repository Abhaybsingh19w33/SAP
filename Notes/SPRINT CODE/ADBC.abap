*&---------------------------------------------------------------------*
*& Report Z7689_ADBC
*&---------------------------------------------------------------------*
** Author            : ABHAY B SINGH
** SAP ID            : TRAINEE11
** USERID            : ABHBHAGW
** Creation Date     : 29-08-2022
** Package           : ZYNY_ABHAY_SAP_HANA
** TR Number         : LS4K907251
** Functional Module : MM
** RICEFW ID         : 21
** Object Descriptio : DISPLAY PRODUCTION ORDER DETAILS ALONG WITH PLANT
**                     AND ORDER ITEM IN THE ALV IDA.
*&---------------------------------------------------------------------*
REPORT Z7689_ADBC.

* DATA HAS BEEN TAKEN FROM TABLE: T001W, AUFK, AFPO.
TABLES : T001W, AUFK, AFPO.


***-----------------------------------------------------------------**
*** Type declaration
***-----------------------------------------------------------------**

TYPES: BEGIN OF TY_FINAL,"User defined internal table type
         WERKS TYPE T001W-WERKS,"PLant
         NAME1 TYPE T001W-NAME1,"Name
         BWKEY TYPE T001W-BWKEY,"Valuation Area
         STRAS TYPE T001W-STRAS,"House number and street
         ORT01 TYPE T001W-ORT01,"City
         LAND1 TYPE T001W-LAND1,"Country Key
         AUFNR TYPE AUFK-AUFNR,"Order Number
         KTEXT TYPE AUFK-KTEXT,"Description
         POSNR TYPE AFPO-POSNR,"Order Item Number
         PSMNG TYPE AFPO-PSMNG,"Order Ite Quantity
         MEINS TYPE AFPO-MEINS,"Base Unit of Measure
         MATNR TYPE AFPO-MATNR,"Material Number of Order
         SALGRADE(8)  TYPE C,
      END OF TY_FINAL.

***-----------------------------------------------------------------**
*** Data declaration
***-----------------------------------------------------------------**

DATA orf_1 TYPE REF TO cx_root.

DATA : WA_EMP TYPE TY_FINAL,
       IT_ORDER TYPE TABLE OF TY_FINAL.

DATA: O_CONN   TYPE REF TO CL_SQL_CONNECTION,"Database Connection
      O_SQL    TYPE REF TO CL_SQL_STATEMENT,"SQL statement
      O_RESULT TYPE REF TO CL_SQL_RESULT_SET,"Resulting Set of an SQL Query
      V_SQL    TYPE STRING,
      O_DATA   TYPE REF TO DATA,
      V_COUNT  TYPE I.


"IT_ORDER is the table type of the output that you want
"to display.
"Reference variables like this can point to any data objects.
GET REFERENCE OF IT_ORDER INTO O_DATA.
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

*Create the VSQL

V_SQL = | select T001W.WERKS, T001W.NAME1, T001W.BWKEY, T001W.STRAS, T001W.ORT01, T001W.LAND1, AUFK.AUFNR, AUFK.KTEXT, AFPO.POSNR, AFPO.PSMNG, AFPO.MEINS, AFPO.MATNR, | &&
       | case When AFPO.PSMNG between 1 and 100 then 'LOW' | &&
       | when AFPO.PSMNG between 101 and 1000 then 'MEDIUM' | &&
       | when AFPO.PSMNG > 1001 then 'HIGH' | &&

       | else 'NA'  end as  SALGRADE | &&
       | from T001W INNER JOIN AUFK ON T001W.WERKS=AUFK.WERKS | &&
      |  INNER JOIN AFPO ON AUFK.AUFNR = AFPO.AUFNR | &&
      | where T001W.MANDT = '{ SY-MANDT }' | .

*V_SQL = | select EKKO.EBELN , EKKO.BUKRS , EKKO.BSTYP , EKKO.BSART , EKKO.LIFNR , EKPO.EBELP, EKPO.TXZ01 , EKPO.WERKS , EKPO.MENGE , EKPO.MEINS , EKPO.NETWR , EKET.ETENR , | &&
*| CASE  WHEN EKPO.NETWR between '1' and '2000' then 'LOW' | &&
*| when EKPO.NETWR between '2001' and '5000' then 'MEDIUM' | &&
*| WHEN EKPO.NETWR > '5001' THEN 'HIGH' | &&
*| else 'NA'| &&
*| end as GRADE | &&
*|  from EKKO INNER JOIN | &&
*| EKPO ON  EKPO.EBELN = EKKO.EBELN | &&
*| INNER JOIN EKET ON ( ( EKPO.EBELP = EKET.EBELP ) AND ( EKPO.EBELN = EKET.EBELN ) ) | &&
*| where EKKO.MANDT = '{ SY-MANDT }' |.

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

CATCH CX_SQL_EXCEPTION INTO orf_1.
WRITE 'EXCEPTION OCCURED'.
WRITE: / 'Text is:'(001), orf_1->get_text( ).
WRITE: / 'Long Text is:'(002), orf_1->get_longtext( ).

ENDTRY.

"Class used to display out
CL_DEMO_OUTPUT=>DISPLAY( IT_ORDER ).