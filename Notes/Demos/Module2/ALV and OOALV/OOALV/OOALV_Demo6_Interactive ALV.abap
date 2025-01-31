*create screen 100 with a custom contol named container  and a button with fctcode BACK
*In the flow logic uncomment
*MODULE STATUS_0100.
*MODULE USER_COMMAND_0100
*create screen 100 with a custom contol named container1  and a button with fctcode BACK
*In the flow logic uncomment
*MODULE STATUS_0200.
*MODULE USER_COMMAND_0200


REPORT  Z.
TYPES : BEGIN OF TY_SPFLI,  "User defined internal table type
          CARRID    TYPE SPFLI-CARRID,
          CONNID    TYPE SPFLI-CONNID,
          COUNTRYFR TYPE SPFLI-COUNTRYFR,
          CITYFROM  TYPE SPFLI-CITYFROM,
        END OF TY_SPFLI.
DATA:
  IT_SPFLI      TYPE TABLE OF TY_SPFLI,
  WA_SPFLI      LIKE LINE OF IT_SPFLI,
  IT_FCAT_SPFLI TYPE LVC_T_FCAT,
  WA_FCAT_SPFLI TYPE LVC_S_FCAT.

TYPES : BEGIN OF TY_SFLIGHT,
          CARRID TYPE SFLIGHT-CARRID,
          CONNID TYPE SFLIGHT-CONNID,
          FLDATE TYPE SFLIGHT-FLDATE,
          PRICE  TYPE SFLIGHT-PRICE,
        END OF TY_SFLIGHT.

DATA : IT_SFLIGHT TYPE TABLE OF TY_SFLIGHT, "SFLIGHT internal table
       WA_SFLIGHT TYPE TY_SFLIGHT.
DATA IT_FCAT_SFLIGHT TYPE LVC_T_FCAT. "SFLIGHT field catalog
DATA WA_FCAT_SFLIGHT LIKE LINE OF IT_FCAT_SFLIGHT.


DATA: R_CONTAINER  TYPE REF TO CL_GUI_CUSTOM_CONTAINER,
      R_CONTAINER1 TYPE REF TO CL_GUI_CUSTOM_CONTAINER,
      R_GRID       TYPE REF TO CL_GUI_ALV_GRID,
      R_GRID1      TYPE REF TO CL_GUI_ALV_GRID.

CLASS LC_CLS DEFINITION.
  PUBLIC SECTION.
    METHODS METH1 FOR EVENT DOUBLE_CLICK OF CL_GUI_ALV_GRID
      IMPORTING E_ROW E_COLUMN.

ENDCLASS.

CLASS LC_CLS IMPLEMENTATION.
  METHOD METH1.
    IF E_COLUMN-FIELDNAME = 'CARRID'.
      PERFORM DISPFLIGHTDET.
    ELSEIF E_COLUMN-FIELDNAME = 'CONNID'.
      CALL TRANSACTION 'SE11'.
    ENDIF.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  SELECT CARRID CONNID COUNTRYFR CITYFROM FROM SPFLI
        INTO TABLE IT_SPFLI.
  CALL SCREEN 100.


MODULE STATUS_0100 OUTPUT.
  CREATE OBJECT R_CONTAINER
    EXPORTING
      CONTAINER_NAME = 'CONTAINER'.

  CREATE OBJECT R_GRID
    EXPORTING
      I_PARENT = R_CONTAINER.

  DATA OBJ1 TYPE REF TO LC_CLS.
  CREATE OBJECT OBJ1.

  SET HANDLER OBJ1->METH1 FOR R_GRID.

  PERFORM CREATE_FCAT_SPFLI.
  CALL METHOD R_GRID->SET_TABLE_FOR_FIRST_DISPLAY
    CHANGING
      IT_FIELDCATALOG = IT_FCAT_SPFLI
      IT_OUTTAB       = IT_SPFLI.
ENDMODULE.


MODULE USER_COMMAND_0100 INPUT.
  CASE SY-UCOMM.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
  ENDCASE.
ENDMODULE.


FORM CREATE_FCAT_SPFLI.
  WA_FCAT_SPFLI-COL_POS = '1' .
  WA_FCAT_SPFLI-FIELDNAME = 'CARRID' . "Field Name of the DB table
  "WA_FCAT_SPFLI-REF_FIELD = 'COUNTRYFR' .
  "WA_FCAT_SPFLI-REF_TABLE = 'SPFLI' .
  WA_FCAT_SPFLI-SELTEXT = 'Airline' . "Col Heading to be displayed
  APPEND WA_FCAT_SPFLI TO IT_FCAT_SPFLI .
  CLEAR WA_FCAT_SPFLI .

  WA_FCAT_SPFLI-COL_POS = '2' .
  WA_FCAT_SPFLI-FIELDNAME = 'CONNID' .
  " WA_FCAT_SPFLI-TABNAME = 'IT_SPFLI' .
  WA_FCAT_SPFLI-SELTEXT = 'Flight Number' .
  APPEND WA_FCAT_SPFLI TO IT_FCAT_SPFLI .
  CLEAR WA_FCAT_SPFLI .

  WA_FCAT_SPFLI-COL_POS = '3' .
  WA_FCAT_SPFLI-FIELDNAME = 'COUNTRYFR' .
  WA_FCAT_SPFLI-NO_OUT = 'X' .
  WA_FCAT_SPFLI-TABNAME = 'IT_SPFLI' .
  WA_FCAT_SPFLI-SELTEXT = 'Country From' .
*  WA_FCAT_SPFLI-EDIT = 'X' .
  APPEND WA_FCAT_SPFLI TO IT_FCAT_SPFLI .
  CLEAR WA_FCAT_SPFLI .

  WA_FCAT_SPFLI-COL_POS = '4' .
  WA_FCAT_SPFLI-FIELDNAME = 'CITYFROM' .
  WA_FCAT_SPFLI-TABNAME = 'IT_SPFLI' .
  WA_FCAT_SPFLI-SELTEXT = 'Departure City' .
  WA_FCAT_SPFLI-EMPHASIZE = 'C610'.
  APPEND WA_FCAT_SPFLI TO IT_FCAT_SPFLI .
  CLEAR WA_FCAT_SPFLI .

ENDFORM.

FORM DISPFLIGHTDET.
  PERFORM GET_DATA_SFLIGHT.
  PERFORM CREATE_FCAT_SFLIGHT.
  PERFORM DISP_ALV_SFLIGHT.
ENDFORM.


FORM GET_DATA_SFLIGHT.
  SELECT  CARRID CONNID
              FLDATE
              PRICE FROM SFLIGHT INTO TABLE IT_SFLIGHT.  "get flight data
      "FOR ALL ENTRIES IN IT_SPFLI WHERE CARRID = IT_SPFLI-CARRID.
ENDFORM.

FORM CREATE_FCAT_SFLIGHT.
***build fcat for SFLIGHT
  WA_FCAT_SFLIGHT-COL_POS       = '1'.
  WA_FCAT_SFLIGHT-FIELDNAME     = 'CARRID'.
  WA_FCAT_SFLIGHT-SELTEXT = 'CARRID'.
  APPEND WA_FCAT_SFLIGHT TO IT_FCAT_SFLIGHT.
  CLEAR WA_FCAT_SFLIGHT.

  WA_FCAT_SFLIGHT-COL_POS       = '2'.
  WA_FCAT_SFLIGHT-FIELDNAME     = 'CONNID'.
  WA_FCAT_SFLIGHT-SELTEXT = 'CONNID'.
  APPEND WA_FCAT_SFLIGHT TO IT_FCAT_SFLIGHT.
  CLEAR WA_FCAT_SFLIGHT.

  WA_FCAT_SFLIGHT-COL_POS       = '3'.
  WA_FCAT_SFLIGHT-FIELDNAME     = 'FLDATE'.
  WA_FCAT_SFLIGHT-SELTEXT = 'Flight Date'.
  APPEND WA_FCAT_SFLIGHT TO IT_FCAT_SFLIGHT.
  CLEAR WA_FCAT_SFLIGHT.

  WA_FCAT_SFLIGHT-COL_POS       = '4'.
  WA_FCAT_SFLIGHT-FIELDNAME     = 'PRICE'.
  WA_FCAT_SFLIGHT-SELTEXT = 'Airfare'.
  APPEND WA_FCAT_SFLIGHT TO IT_FCAT_SFLIGHT.
  CLEAR WA_FCAT_SFLIGHT.


ENDFORM.

 MODULE STATUS_0200 OUTPUT.
  CREATE OBJECT R_CONTAINER1
    EXPORTING
      CONTAINER_NAME = 'CONTAINER1'.

  CREATE OBJECT R_GRID1
    EXPORTING
      I_PARENT = R_CONTAINER1.

  CALL METHOD R_GRID1->SET_TABLE_FOR_FIRST_DISPLAY
    CHANGING
      IT_FIELDCATALOG = IT_FCAT_SFLIGHT
      IT_OUTTAB       = IT_SFLIGHT.
ENDMODULE.

MODULE USER_COMMAND_0200 INPUT.
  CASE SY-UCOMM.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
  ENDCASE.
ENDMODULE.

FORM DISP_ALV_SFLIGHT.
  CALL SCREEN 200.
ENDFORM.