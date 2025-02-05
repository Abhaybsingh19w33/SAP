*&---------------------------------------------------------------------*
*& Report SPRINT_ADOBE
*&---------------------------------------------------------------------*
** Author            : ABHAY B SINGH
** SAP ID            : TRAINEE37
** USERID            : ABHBHAGW
** Creation Date     : 29-08-2022
** Package           : ZYNY_ABHAY_PACKAGE_1
** TR Number         : LD5K914299
** Functional Module : MM
** RICEFW ID         : 21
** Object Descriptio : DISPLAY PRODUCTION ORDER DETAILS ALONG WITH PLANT
**                     AND ORDER ITEM IN THE ADOBE REPORT.
*&---------------------------------------------------------------------*
REPORT SPRINT_ADOBE .
* purpose: DISPLAYING PRODUCTION ORDER DETAILS ALONG WITH PLANT AND ORDER ITEM IN THE ALV REPORT.
* DATA HAS BEEN TAKEN FROM TABLE: T001W, AUFK, AFPO.

***-----------------------------------------------------------------**
*** Data declaration
***-----------------------------------------------------------------**

* WORKAREA DECLARATION
TABLES : T001W, AUFK, AFPO.

*TYPE DECLARATION
TYPES : BEGIN OF TY_T001W,"User defined internal table type
          WERKS TYPE T001W-WERKS,"PLant
          NAME1 TYPE T001W-NAME1,"Name
          BWKEY TYPE T001W-BWKEY,"Valuation Area
        END OF TY_T001W.

*INTERNAL TABLE, WORK AREA
DATA: IT_T001W TYPE TABLE OF TY_T001W,
      WA_T001W TYPE TY_T001W.

*TYPE DECLARATION
TYPES : BEGIN OF TY_ORDERS,
          WERKS TYPE AUFK-WERKS,"Plant
          AUFNR TYPE AUFK-AUFNR,"Order Number
          AUTYP TYPE AUFK-AUTYP,"Order Category
          KTEXT TYPE AUFK-KTEXT,"Description
          POSNR TYPE AFPO-POSNR,"Order Item Number
          PSMNG TYPE AFPO-PSMNG,"Order Ite Quantity
          MEINS TYPE AFPO-MEINS,"Base Unit of Measure
          MATNR TYPE AFPO-MATNR,"Material Number of Order
        END OF TY_ORDERS.

*INTERNAL TABLE, WORK AREA
DATA : IT_ORDERS      TYPE TABLE OF TY_ORDERS,
       WA_ORDERS      TYPE TY_ORDERS,
       IT_PLANT_WISE_ORDERS TYPE TABLE OF TY_ORDERS.

*FOR PRINTER DIALOG SCREEN
DATA : WA_OUTPUTPARAMS TYPE SFPOUTPUTPARAMS."Form Processing Output Parameter

DATA : GV_FM_NAME TYPE RS38L_FNAM. "Name of Function Module

DATA : FM_NAME TYPE FPNAME.

***-----------------------------------------------------------------**
*** Selection screen
***-----------------------------------------------------------------**

SELECT-OPTIONS : S_WERKS FOR T001W-WERKS. "INPUT THIS NEEDS TO BE CHANGED

INITIALIZATION.
FM_NAME = 'SPRINT_ADOBE'.

***-----------------------------------------------------------------**
*** Data Selection
***-----------------------------------------------------------------**
START-OF-SELECTION.
   WA_OUTPUTPARAMS-DEVICE = 'PRINTER'."Output device
   WA_OUTPUTPARAMS-DEST  = 'LP01'."Spool: Output device
   WA_OUTPUTPARAMS-NODIALOG = 'X'."Suppress User Dialog
   WA_OUTPUTPARAMS-PREVIEW  = 'X'."Preview

** --- Data selection subroutine
  PERFORM sub_data_select.

***  Data processing AND CALLING ADOBE FORM
  PERFORM sub_data_processing.



*&---------------------------------------------------------------------*
*& Form sub_data_select
*&---------------------------------------------------------------------*
*& Data selection
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM sub_data_select .
  SELECT WERKS NAME1 BWKEY FROM T001W INTO TABLE IT_T001W WHERE WERKS IN S_WERKS.
*    ERROR HANDLING
  IF SY-SUBRC <> 0.
    MESSAGE TEXT-001 TYPE 'E'.
  ENDIF.

*   CHECKING IF INTERNAL TABLE IS NOT EMPTY
  IF IT_T001W IS NOT INITIAL.
*   PERFORM JOIN BETWEEN AUFK AND AFPO
   SELECT A~WERKS A~AUFNR A~AUTYP A~KTEXT B~POSNR B~PSMNG B~MEINS B~MATNR
     INTO TABLE IT_ORDERS FROM
          AUFK AS A INNER JOIN
          AFPO AS B ON
          A~AUFNR EQ B~AUFNR
          FOR ALL ENTRIES IN IT_T001W
          WHERE A~WERKS EQ IT_T001W-WERKS.

*     ERROR HANDLING
    IF SY-SUBRC <> 0.
      MESSAGE TEXT-001 TYPE 'E'.
    ENDIF.
  ENDIF.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form sub_data_processing
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM sub_data_processing .

*   PASS THE OUTPUT SETTINGS
  CALL FUNCTION 'FP_JOB_OPEN' "Form Processing: Call Form FOR OPENING THE JOB
       CHANGING
         IE_OUTPUTPARAMS       = WA_OUTPUTPARAMS
      EXCEPTIONS
        CANCEL                = 1
        USAGE_ERROR           = 2
        SYSTEM_ERROR          = 3
        INTERNAL_ERROR        = 4
        OTHERS                = 5
               .

*     ERROR HANDLING
    IF SY-SUBRC = 1.
      MESSAGE TEXT-002 TYPE 'E'.
    ELSEIF SY-SUBRC = 2.
      MESSAGE TEXT-003 TYPE 'E'.
    ELSEIF SY-SUBRC = 3.
      MESSAGE TEXT-004 TYPE 'E'.
    ELSEIF SY-SUBRC = 4.
      MESSAGE TEXT-005 TYPE 'E'.
    ELSE.
     MESSAGE TEXT-006 TYPE 'S'.
  ENDIF.

*   SORT INTERNAL TABLE IT_ORDERS BASED ON WERKS
  SORT IT_ORDERS BY WERKS.

*   DELETE ALL DATA FROM INTERNAL TABLE IT_PLANT_WISE_ORDERS
  REFRESH IT_PLANT_WISE_ORDERS.

*   SORTED INTERNAL TABLE IT_ORDERS, FURTHER PASSED IN BLOCKS TO THE ADOBE FUNCTION MODULE
  LOOP AT  IT_ORDERS INTO WA_ORDERS.
    APPEND WA_ORDERS TO IT_PLANT_WISE_ORDERS.

*    AT END OF A BLOCK CALL THE FUNCTION MODULE
    AT END OF WERKS.
     IF IT_PLANT_WISE_ORDERS IS NOT INITIAL.

      CLEAR WA_T001W.
      READ TABLE IT_T001W INTO WA_T001W WITH KEY WERKS = WA_ORDERS-WERKS.

     CALL FUNCTION 'FP_FUNCTION_MODULE_NAME' "Form Processing Generation
       EXPORTING
        I_NAME                     = FM_NAME " Adobe form name.
      IMPORTING
        E_FUNCNAME                 = GV_FM_NAME
               .

      CALL FUNCTION GV_FM_NAME
          EXPORTING
            IT_T001W                 = WA_T001W
            IT_ORDERS                = IT_PLANT_WISE_ORDERS
         EXCEPTIONS
           USAGE_ERROR              = 1
           SYSTEM_ERROR             = 2
           INTERNAL_ERROR           = 3
           OTHERS                   = 4
                  .

*       ERROR HANDLING
      IF SY-SUBRC = 1.
        MESSAGE TEXT-007 TYPE 'E'.
      ELSEIF SY-SUBRC = 2.
        MESSAGE TEXT-008 TYPE 'E'.
      ELSEIF SY-SUBRC = 3.
        MESSAGE TEXT-009 TYPE 'E'.
      ELSE.
       MESSAGE TEXT-010 TYPE 'S'.
      ENDIF.
     ENDIF.

*     DELETE ALL DATA FROM IT_PLANT_WISE_ORDERS
     REFRESH IT_PLANT_WISE_ORDERS.
    ENDAT.
  ENDLOOP.

  CALL FUNCTION 'FP_JOB_CLOSE' "Form Processing: Call Form FOR CLOSING THE JOB
       EXCEPTIONS
         USAGE_ERROR          = 1
         SYSTEM_ERROR         = 2
         INTERNAL_ERROR       = 3
         OTHERS               = 4
                .

*      ERROR HANDLING
    IF SY-SUBRC = 1.
      MESSAGE TEXT-011 TYPE 'E'.
    ELSEIF SY-SUBRC = 2.
      MESSAGE TEXT-012 TYPE 'E'.
    ELSEIF SY-SUBRC = 3.
      MESSAGE TEXT-013 TYPE 'E'.
    ELSE.
     MESSAGE TEXT-014 TYPE 'S'.
    ENDIF.
  ENDFORM.