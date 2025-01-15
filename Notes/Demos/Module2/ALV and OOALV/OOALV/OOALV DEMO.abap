REPORT ZYNY_OOALV_DEMO_04.

TYPES: BEGIN OF TY_MATERIAL,
        MATNR TYPE MATNR,
        MAKTX TYPE MAKTX,
       END OF TY_MATERIAL.

DATA: G_MATNR     LIKE MARA-MATNR,
      GT_MATERIAL TYPE STANDARD TABLE OF TY_MATERIAL.

*----------------------------------------------------------------------*
*       CLASS cl_handler DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS CL_HANDLER DEFINITION.
  PUBLIC SECTION.
    METHODS ON_DOUBLE_CLICK FOR EVENT DOUBLE_CLICK OF CL_SALV_EVENTS_TABLE
      IMPORTING ROW COLUMN.
ENDCLASS.                    "cl_handler DEFINITION

*----------------------------------------------------------------------*
*       CLASS cl_handler IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS CL_HANDLER IMPLEMENTATION.
  METHOD ON_DOUBLE_CLICK.
    MESSAGE I010(ZNYN_MESSAGE_CLASS) WITH ROW COLUMN.
*    MESSAGE COLUMN TYPE 'I'.
    IF COLUMN EQ 'MATNR'.
      READ TABLE GT_MATERIAL INTO DATA(WA_ST_DATA) INDEX ROW.

* Check that material exists
      SELECT COUNT( * ) FROM MARA UP TO 1 ROWS WHERE MATNR EQ WA_ST_DATA-MATNR.

      IF SY-SUBRC = 0. " Exists?
* Load parameters
        SET PARAMETER ID 'MXX' FIELD 'K'. " Default view
        SET PARAMETER ID 'MAT' FIELD WA_ST_DATA-MATNR. " Material number
*
*        CALL TRANSACTION 'MM03' AND SKIP FIRST SCREEN.
        CALL TRANSACTION 'MM03'.
*        MESSAGE I010(ZNYN_MESSAGE_CLASS) WITH WA_ST_DATA-MATNR.
      ELSE. " No ?

        CALL FUNCTION 'CONVERSION_EXIT_ALPHA_OUTPUT'
          EXPORTING
            INPUT  = WA_ST_DATA-MATNR
          IMPORTING
            OUTPUT = WA_ST_DATA-MATNR.

        DATA(LV_ERR) = `Material ` && WA_ST_DATA-MATNR && ` does not exist.`.
        MESSAGE LV_ERR TYPE 'I' DISPLAY LIKE 'E'.
      ENDIF.
    ELSE.
      MESSAGE TEXT-002 TYPE 'I'. " Invalid cell
    ENDIF.
  ENDMETHOD.                    "on_double_click
ENDCLASS.                    "cl_handler IMPLEMENTATION

SELECTION-SCREEN: BEGIN OF BLOCK B1 WITH FRAME TITLE TEXT-001.
SELECT-OPTIONS: SO_MATNR FOR G_MATNR.
SELECTION-SCREEN: END OF BLOCK B1.

START-OF-SELECTION.
  PERFORM RETRIEVE_DATA.
  PERFORM DISPLAY.

*&---------------------------------------------------------------------*
*&      Form  get_data
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM RETRIEVE_DATA.
  SELECT MATNR MAKTX FROM MAKT UP TO 100 ROWS " Retrieve only 100 records
    INTO TABLE GT_MATERIAL
    WHERE MATNR IN SO_MATNR AND SPRAS EQ SY-LANGU.
ENDFORM.                    "get_data

*&---------------------------------------------------------------------*
*&      Form  display
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM DISPLAY.
  DATA: LO_GR_ALV       TYPE REF TO CL_SALV_TABLE, " Variables for ALV properties
        LO_GR_FUNCTIONS TYPE REF TO CL_SALV_FUNCTIONS_LIST.

  DATA: LO_EVENT_HANDLER TYPE REF TO CL_HANDLER, " Variables for events
        LO_EVENTS        TYPE REF TO CL_SALV_EVENTS_TABLE.

  DATA: LO_GRID        TYPE REF TO CL_SALV_FORM_LAYOUT_GRID, " Variables for header
        LO_LAYOUT_LOGO TYPE REF TO CL_SALV_FORM_LAYOUT_LOGO,
        LO_GRID_FOOTER        TYPE REF TO CL_SALV_FORM_LAYOUT_GRID, " Variables for header
        LO_LAYOUT_LOGO_FOOTER TYPE REF TO CL_SALV_FORM_LAYOUT_LOGO,
        LO_CONTENT     TYPE REF TO CL_SALV_FORM_ELEMENT,
        LV_TITLE       TYPE STRING,
        LV_FOOTER      TYPE STRING,
        LV_ROWS        TYPE STRING.

  DATA: LO_LAYOUT TYPE REF TO CL_SALV_LAYOUT, " Variables for enabling Save button
        LV_KEY    TYPE SALV_S_LAYOUT_KEY.

  DATA: LO_DISPLAY TYPE REF TO CL_SALV_DISPLAY_SETTINGS. " Variable for layout settings

  DATA: LO_SELECTIONS TYPE REF TO CL_SALV_SELECTIONS, " Variables for selection mode and column properties
        LO_COLUMNS    TYPE REF TO CL_SALV_COLUMNS,
        LO_COLUMN     TYPE REF TO CL_SALV_COLUMN_TABLE.

* Create the ALV object
  TRY.
      CALL METHOD CL_SALV_TABLE=>FACTORY
        IMPORTING
          R_SALV_TABLE = LO_GR_ALV
        CHANGING
          T_TABLE      = GT_MATERIAL.
    CATCH CX_SALV_MSG.
  ENDTRY.

* Let's show all default buttons of ALV
  LO_GR_FUNCTIONS = LO_GR_ALV->GET_FUNCTIONS( ).
  LO_GR_FUNCTIONS->SET_ALL( ABAP_TRUE ).

* Fit the columns
  LO_COLUMNS = LO_GR_ALV->GET_COLUMNS( ).
  LO_COLUMNS->SET_OPTIMIZE( 'X' ).

* Create header
  DESCRIBE TABLE GT_MATERIAL LINES LV_ROWS.
  CONCATENATE 'Number of lv_rows: ' LV_ROWS INTO LV_TITLE SEPARATED BY SPACE.

  CREATE OBJECT LO_GRID.
  CREATE OBJECT LO_LAYOUT_LOGO.
  LO_GRID->CREATE_LABEL( ROW = 1 COLUMN = 1 TEXT = LV_TITLE TOOLTIP = LV_TITLE ).
  LO_GRID->CREATE_LABEL( ROW = 2 COLUMN = 2 TEXT = LV_TITLE TOOLTIP = LV_TITLE ).
  LO_LAYOUT_LOGO->SET_LEFT_CONTENT( LO_GRID ).
  LO_CONTENT = LO_LAYOUT_LOGO.
  LO_GR_ALV->SET_TOP_OF_LIST( LO_CONTENT ).

  CREATE OBJECT LO_GRID_FOOTER.
  CREATE OBJECT LO_LAYOUT_LOGO_FOOTER.
  LO_GRID_FOOTER->CREATE_LABEL( ROW = 1 COLUMN = 1 TEXT = 'FOOTER TEXT' ).
  LO_LAYOUT_LOGO_FOOTER->SET_LEFT_CONTENT( LO_GRID_FOOTER ).
  LO_CONTENT = LO_LAYOUT_LOGO_FOOTER.
  LO_GR_ALV->SET_END_OF_LIST( LO_CONTENT ).

* Apply zebra style to lv_rows
  LO_DISPLAY = LO_GR_ALV->GET_DISPLAY_SETTINGS( ).
  LO_DISPLAY->SET_STRIPED_PATTERN( CL_SALV_DISPLAY_SETTINGS=>TRUE ).

* Enable the save layout buttons
  LV_KEY-REPORT = SY-REPID.
  LO_LAYOUT = LO_GR_ALV->GET_LAYOUT( ).
  LO_LAYOUT->SET_KEY( LV_KEY ).
  LO_LAYOUT->SET_SAVE_RESTRICTION( IF_SALV_C_LAYOUT=>RESTRICT_NONE ).
  LO_LAYOUT->SET_DEFAULT( ABAP_TRUE ).

* Register events
  LO_EVENTS = LO_GR_ALV->GET_EVENT( ).
  CREATE OBJECT LO_EVENT_HANDLER.
  SET HANDLER LO_EVENT_HANDLER->ON_DOUBLE_CLICK FOR LO_EVENTS.

* Enable cell selection mode
  LO_SELECTIONS = LO_GR_ALV->GET_SELECTIONS( ).
*  LO_SELECTIONS->SET_SELECTION_MODE( IF_SALV_C_SELECTION_MODE=>ROW_COLUMN ).
  LO_SELECTIONS->SET_SELECTION_MODE( IF_SALV_C_SELECTION_MODE=>MULTIPLE ).

  TRY.
      LO_COLUMN ?= LO_COLUMNS->GET_COLUMN( 'MAKTX' ). " Find the 'MAKTX' column ans change attributes
      LO_COLUMN->SET_VISIBLE( IF_SALV_C_BOOL_SAP=>TRUE ).
      LO_COLUMN->SET_LONG_TEXT( 'MyTitleLONG' ).
      LO_COLUMN->SET_MEDIUM_TEXT( 'MyTitleMEDIUM' ).
      LO_COLUMN->SET_SHORT_TEXT( 'MyTitleS' ).
    CATCH CX_SALV_NOT_FOUND.
    CATCH CX_SALV_EXISTING.
    CATCH CX_SALV_DATA_ERROR.
  ENDTRY.

  LO_GR_ALV->DISPLAY( ).
ENDFORM.                    "display