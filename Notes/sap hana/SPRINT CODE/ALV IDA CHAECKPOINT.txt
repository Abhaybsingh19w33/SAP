*&---------------------------------------------------------------------*
*& Report Z7689_ALV_IDA
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

REPORT Z7689_ALV_IDA.

* DATA HAS BEEN TAKEN FROM TABLE: T001W, AUFK, AFPO.
TABLES: T001W, AUFK,  AFPO.
*1... Declare SELECT-OPIONS

SELECT-OPTIONS S_WERKS FOR T001W-WERKS.
*CL_SALV_GUI_TABLE_IDA class has method create which returns RO_ALV_GUI_TABLE_IDA.
*RO_ALV_GUI_TABLE_IDA is of type IF_SALV_GUI_TABLE_IDA.
*IF_SALV_GUI_TABLE_IDA has method FULLSCREEN.
*IF_SALV_GUI_TABLE_IDA has method SET_SELECT_OPTIONS.

* SET_SELECT_OPTIONS has parameter IT_RANGES
* IT_RANGES has an IMPORTING PARAMETER of TYPE IF_SALV_SERVICE_TYPES=>YT_NAMED_RANGES
* IF_SALV_SERVICE_TYPES IS AN INTERFACE WHIUCH HAS THE TYPE YT_NAMED_RANGES

*CL_SALV_RANGE_TAB_COLLECTOR is a class which has the method ADD_RANGES_FOR_NAME
* ADD_RANGES_FOR_NAME has an Importing parameter IV_NAME
* IV_NAME is of type string
* ADD_RANGES_FOR_NAME has an Importing parameter IT_RANGES
* IT_RANGES is an Internal table (ANY TABLE) type

*CL_SALV_RANGE_TAB_COLLECTOR is a class which has the method GET_COLLECTED_RANGES
*GET_COLLECTED_RANGES has Exporting parameter with name ET_NAMED_RANGES
*ET_NAMED_RANGES is of type IF_SALV_SERVICE_TYPES=>YT_NAMED_RANGES

START-OF-SELECTION.
*2... Create object reference ALV with IDA
DATA(LO_ALV) = CL_SALV_GUI_TABLE_IDA=>CREATE_FOR_CDS_VIEW( 'Z7689_CDS_BASE' ).

*3... Build range tables
DATA LO_RANGE_COLLECTOR TYPE REF TO CL_SALV_RANGE_TAB_COLLECTOR.
CREATE OBJECT LO_RANGE_COLLECTOR.
*OR
"DATA(LO_RANGE_COLLECTOR) = NEW CL_SALV_RANGE_TAB_COLLECTOR( ).
*
LO_RANGE_COLLECTOR->ADD_RANGES_FOR_NAME( IV_NAME = 'WERKS'
                                         IT_RANGES = S_WERKS[] ).
DATA LT_SELECT_OPTIONS TYPE IF_SALV_SERVICE_TYPES=>YT_NAMED_RANGES.

LO_RANGE_COLLECTOR->GET_COLLECTED_RANGES(
                     IMPORTING
                        ET_NAMED_RANGES = LT_SELECT_OPTIONS ).

***4... Set select options
LO_ALV->SET_SELECT_OPTIONS( IT_RANGES = LT_SELECT_OPTIONS ).
LO_ALV->FULLSCREEN( )->DISPLAY( ).