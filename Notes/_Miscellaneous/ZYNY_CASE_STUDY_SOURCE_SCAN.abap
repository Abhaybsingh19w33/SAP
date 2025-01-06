PROGRAM ZYNY_CASE_STUDY_SOURCE_SCAN.

TYPE-POOLS:
  slis,
  sscr.

TABLES:
  seoclasstx,                                                           " Short description class/interface
  tadir,                                                                " Directory of Repository Objects
  tlibt,                                                                " Function Group Short Texts
  d020s,                                                                " System Table TRDIR
  trdir.

CLASS:
  lcl_source_scan DEFINITION DEFERRED.

DATA:
  lo_sscan   TYPE REF TO lcl_source_scan,
  lv_sstring TYPE text255,
  lv_appl    TYPE taplt-appl,                                           " Applications programs, function modules, logical databases
  plusminu(2) TYPE n value 2,                                           " TO GET 2 LINES BEFORE AND AFTER OF FOUND STRING
  comment type xfeld value 'X'.

SELECT-OPTIONS sstring FOR lv_sstring NO INTERVALS no-EXTENSION MODIF ID dsp. " STRING SEARCH
SELECT-OPTIONS repname FOR trdir-name NO INTERVALS no-EXTENSION MEMORY ID rs_scan_repid. " PROGRAM NAME

*----------------------------------------------------------------------*
*       CLASS lcx_scan_exceptions DEFINITION
*----------------------------------------------------------------------*
*       Exceptions for source scanning
*----------------------------------------------------------------------*
CLASS lcx_scan_exceptions DEFINITION INHERITING FROM cx_static_check FINAL.
ENDCLASS.                    "lcx_scan_exceptions DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_source_scan DEFINITION
*----------------------------------------------------------------------*
*       ABAP source scanner
*----------------------------------------------------------------------*
CLASS lcl_source_scan DEFINITION FINAL.
  PUBLIC SECTION.
    METHODS:
      constructor,
      start.

  PROTECTED SECTION.
    TYPES:
      BEGIN OF ty_dynpro,
        repname LIKE d020s-prog,
        dynnr  LIKE d020s-dnum,
      END OF ty_dynpro.

    TYPES:
      BEGIN OF ty_ls_objname,
        report TYPE sy-repid,
        dynnr  TYPE sy-dynnr,
      END OF ty_ls_objname.

    DATA:
      go_alv        TYPE REF TO cl_salv_hierseq_table,
      gv_hit_count  TYPE i,
      gv_sstring    TYPE string,
      gv_dynp_found TYPE xfeld,
      gv_vers_found TYPE xfeld,
      gt_dynpro     TYPE STANDARD TABLE OF ty_dynpro,
      gt_object     TYPE STANDARD TABLE OF tadir-obj_name,
      gt_vrsd       TYPE HASHED TABLE OF vrsd
                      WITH UNIQUE KEY objname versno,
      gt_source TYPE abaptxt255_tab,
      gv_report TYPE syrepid,
      gv_dynpro TYPE sydynnr,

      BEGIN OF gs_alv_header,
        repname TYPE tadir-obj_name,
        dynnr   TYPE sy-dynnr,
        expand  TYPE xfeld,
        versno  TYPE vrsd-versno,
      END OF gs_alv_header,

      gt_alv_header LIKE STANDARD TABLE OF gs_alv_header,

      BEGIN OF gs_alv_item,
        repname    TYPE sy-repid,
        dynnr      TYPE sy-dynnr,
        versno     TYPE vrsd-versno,
        line_no    TYPE rsrow,
        text       TYPE text255,
        hit        TYPE xfeld,
        cell_color TYPE lvc_t_scol,
      END OF gs_alv_item,

      gt_alv_item LIKE STANDARD TABLE OF gs_alv_item.

    CONSTANTS:
      gc_x TYPE xfeld VALUE 'X'.

    METHODS:
      add_to_hitlist
        IMPORTING
          iv_report      TYPE clike
          iv_dynpro      TYPE clike OPTIONAL
          iv_source_line TYPE clike
          iv_tabix       TYPE sy-tabix
          iv_hit         TYPE xfeld
          iv_versno      TYPE vrsd-versno,

      display,

      get_alv_instance,

      get_hit_set
        IMPORTING
          iv_report      TYPE clike
          iv_dynpro      TYPE clike OPTIONAL
          it_abap        TYPE abaptxt255_tab
          iv_tabix       TYPE sy-tabix
          iv_versno      TYPE vrsd-versno,

      get_source_names,

      get_source_by_version
        IMPORTING
          iv_report TYPE clike
          iv_dynpro TYPE clike OPTIONAL
          iv_versno TYPE vrsd-versno
        RETURNING VALUE(rt_abap) TYPE abaptxt255_tab,

      search_abap_source   RAISING lcx_scan_exceptions,

      search_source        RAISING lcx_scan_exceptions,

      set_alv_attributes.

ENDCLASS.                    "lcl_source_scan DEFINITION

CLASS lcl_source_scan IMPLEMENTATION.

  METHOD constructor.
    DATA:
      ls_restrict    TYPE sscr_restrict,
      ls_opt_list    TYPE sscr_opt_list,
      ls_association TYPE sscr_ass.

    ls_opt_list-name       = 'RESTRICT'.
    ls_opt_list-options-cp = gc_x.
    ls_opt_list-options-eq = gc_x.

    APPEND ls_opt_list TO ls_restrict-opt_list_tab.

    ls_association-kind    = 'S'.
    ls_association-name    = 'SSTRING'.
    ls_association-sg_main = 'I'.
    ls_association-op_main = ls_association-op_addy = 'RESTRICT'.

    APPEND ls_association TO ls_restrict-ass_tab.

    CALL FUNCTION 'SELECT_OPTIONS_RESTRICT'
      EXPORTING
        program     = sy-repid
        restriction = ls_restrict
      EXCEPTIONS
        OTHERS      = 0.

  ENDMETHOD.                    "constructor

  METHOD set_alv_attributes.
    DATA:
      lo_layout    TYPE REF TO cl_salv_layout,
      lo_functions TYPE REF TO cl_salv_functions_list,
      lo_level     TYPE REF TO cl_salv_hierseq_level,
      lo_column    TYPE REF TO cl_salv_column_hierseq,
      lo_columns   TYPE REF TO cl_salv_columns_hierseq,
      lt_columns   TYPE salv_t_column_ref,
      ls_columns   LIKE LINE OF lt_columns,
      lo_settings  TYPE REF TO cl_salv_display_settings,
      lv_title     TYPE lvc_title,
      lv_hits      TYPE lvc_title,
      ls_color     TYPE lvc_s_colo,
      ls_layout    TYPE salv_s_layout_key,
      lt_functions TYPE salv_t_ui_func.

*   Layout
    ls_layout-report = sy-repid.
    ls_layout-handle = 'SCAN'.

    lo_layout = go_alv->get_layout( ).
    lo_layout->set_key( ls_layout ).
    lo_layout->set_save_restriction( ).

*   Function keys/buttons
    lo_functions = go_alv->get_functions( ).
    lo_functions->set_all( gc_x ).

*   exclude the following functions (column paging buttons)
    lt_functions = lo_functions->get_functions( ).

*   Display settings
    lo_settings = go_alv->get_display_settings( ).

*   Title
    lv_hits = gv_hit_count.
    SHIFT lv_hits LEFT DELETING LEADING space.

    CONCATENATE lv_hits
                'Treffer'(001)
                INTO lv_hits SEPARATED BY space.

    lv_title = 'Source Scan für String:'(002).

    CONCATENATE lv_title
                gv_sstring
                INTO lv_title SEPARATED BY space.

    CONCATENATE lv_title
                lv_hits
                INTO lv_title SEPARATED BY ' - '.

    lo_settings->set_list_header( lv_title ).

*   Field catalog
    TRY.
*       Field catalog/columns - header table
        lo_columns  = go_alv->get_columns( '1' ).
        lt_columns = lo_columns->get( ).

        TRY.
            lo_columns->set_expand_column( 'EXPAND' ).

            lo_level = go_alv->get_level( '1' ).
            lo_level->set_items_expanded( gc_x ).

          CATCH cx_salv_data_error.
        ENDTRY.

        LOOP AT lt_columns INTO ls_columns.
          CASE ls_columns-columnname.
            WHEN 'EXPAND'.
              ls_columns-r_column->set_technical( ).

            WHEN 'DYNNR'.
              IF gv_dynp_found IS INITIAL.
                ls_columns-r_column->set_technical( ).
              ELSE.
                ls_columns-r_column->set_output_length( '15' ).
              ENDIF.

            WHEN 'VERSNO'.
              IF gv_vers_found IS INITIAL.
                ls_columns-r_column->set_technical( ).
              ELSE.
                ls_columns-r_column->set_leading_zero( gc_x ).
                ls_columns-r_column->set_output_length( '15' ).
                TRY.
                    lo_column ?= ls_columns-r_column.
                    lo_column->set_cell_type( if_salv_c_cell_type=>hotspot ).
                  CATCH cx_sy_move_cast_error.
                ENDTRY.
              ENDIF.
          ENDCASE.
        ENDLOOP.

*       Field catalog/columns - item table
        lo_columns = go_alv->get_columns( '2' ).

        TRY.
            lo_columns->set_color_column( 'CELL_COLOR' ).
          CATCH cx_salv_data_error.
        ENDTRY.

        lt_columns = lo_columns->get( ).

        LOOP AT lt_columns INTO ls_columns.
          CASE ls_columns-columnname.
            WHEN 'REPNAME'.
              ls_columns-r_column->set_technical( ).

            WHEN 'DYNNR'.
              ls_columns-r_column->set_technical( ).

            WHEN 'VERSNO'.
              ls_columns-r_column->set_technical( ).

            WHEN 'CELL_COLOR'.
              ls_columns-r_column->set_technical( ).

            WHEN 'HIT'.
              ls_columns-r_column->set_technical( ).

            WHEN 'LINE_NO'.
              ls_color-col = '4'.
              TRY.
                  lo_column ?= ls_columns-r_column.
                  lo_column->set_color( ls_color ).
                  lo_column->set_leading_zero( gc_x ).
                CATCH cx_sy_move_cast_error.
              ENDTRY.

            WHEN 'TEXT'.
              TRY.
                  lo_column ?= ls_columns-r_column.
                  lo_column->set_cell_type( if_salv_c_cell_type=>hotspot ).
                CATCH cx_sy_move_cast_error.
              ENDTRY.

          ENDCASE.
        ENDLOOP.
      CATCH cx_salv_not_found.
    ENDTRY.

  ENDMETHOD.                    "set_alv_attributes

  METHOD get_alv_instance.
    DATA:
      lt_alv_bind TYPE salv_t_hierseq_binding,
      ls_alv_bind LIKE LINE OF lt_alv_bind.

    ls_alv_bind-master = ls_alv_bind-slave = 'REPNAME'.
    APPEND ls_alv_bind TO lt_alv_bind.

    ls_alv_bind-master = ls_alv_bind-slave = 'DYNNR'.
    APPEND ls_alv_bind TO lt_alv_bind.

    ls_alv_bind-master = ls_alv_bind-slave = 'VERSNO'.
    APPEND ls_alv_bind TO lt_alv_bind.

    TRY.
        CALL METHOD cl_salv_hierseq_table=>factory
          EXPORTING
            t_binding_level1_level2 = lt_alv_bind
          IMPORTING
            r_hierseq               = go_alv
          CHANGING
            t_table_level1          = gt_alv_header
            t_table_level2          = gt_alv_item.

      CATCH cx_salv_data_error.
      CATCH cx_salv_not_found.
    ENDTRY.

  ENDMETHOD.                    "get_alv_instance

  METHOD display.

    DATA text TYPE c LENGTH 150.

    IF gv_hit_count IS INITIAL.
      MESSAGE s010(ZNYN_MESSAGE_CLASS) with gv_sstring 'String not found' .
      RETURN.
    ENDIF.

    SORT gt_alv_item BY repname dynnr versno line_no hit DESCENDING.
    DELETE ADJACENT DUPLICATES FROM gt_alv_item COMPARING repname dynnr versno line_no.

    get_alv_instance( ).
    CHECK go_alv IS NOT INITIAL.

    set_alv_attributes( ).

    go_alv->display( ).

  ENDMETHOD.                    "display

  METHOD add_to_hitlist.
    DATA:
      ls_col LIKE LINE OF gs_alv_item-cell_color.

    gs_alv_item-repname = iv_report.
    gs_alv_item-dynnr   = iv_dynpro.
    gs_alv_item-line_no = iv_tabix.
    gs_alv_item-versno  = iv_versno.
    gs_alv_item-text    = iv_source_line.

    IF iv_hit IS NOT INITIAL.
      gs_alv_item-hit = gc_x.
      ADD 1 TO gv_hit_count.
      ls_col-fname     = 'TEXT'.
      ls_col-color-col = '5'.
      APPEND ls_col TO gs_alv_item-cell_color.
    ENDIF.

    APPEND gs_alv_item TO gt_alv_item.

    CLEAR gs_alv_item.
  ENDMETHOD.                    "add_to_hitlist

  METHOD get_hit_set.
    DATA: lv_end     TYPE i,
          lv_start   TYPE i,
          lv_xtabix  TYPE sy-tabix,
          lv_hitline TYPE xfeld.

    FIELD-SYMBOLS:
      <lv_abap> TYPE any.

    lv_start = iv_tabix - plusminu .
    lv_end   = iv_tabix + plusminu.

    IF lv_start < 1.
      lv_start = 1.
    ENDIF.

    WHILE lv_start <= lv_end.
      READ TABLE it_abap ASSIGNING <lv_abap> INDEX lv_start.
      IF sy-subrc IS NOT INITIAL.
        EXIT.
      ENDIF.

      lv_xtabix = sy-tabix.

      IF lv_start = iv_tabix.
        lv_hitline = gc_x.
      ELSE.
        CLEAR lv_hitline.
      ENDIF.

      ADD 1 TO lv_start.

      IF comment IS NOT INITIAL.
          IF <lv_abap>(1) = '*'.
            IF  <lv_abap>(2) = '*{' OR <lv_abap>(2) = '*}'.
            ELSE.
              CONTINUE.
            ENDIF.
          ENDIF.
      ENDIF.

      CALL METHOD add_to_hitlist
        EXPORTING
          iv_report      = iv_report
          iv_dynpro      = iv_dynpro
          iv_source_line = <lv_abap>
          iv_tabix       = lv_xtabix
          iv_hit         = lv_hitline
          iv_versno      = iv_versno.

    ENDWHILE.

  ENDMETHOD.                    "get_hit_set

  METHOD get_source_by_version. "
    DATA:
      lv_object_name TYPE versobjnam,
      ls_object_name TYPE ty_ls_objname,
      lt_trdir       TYPE STANDARD TABLE OF trdir,
      lt_d022s       TYPE STANDARD TABLE OF d022s.

    IF iv_dynpro IS INITIAL.
      lv_object_name = iv_report.

      CALL FUNCTION 'SVRS_GET_REPS_FROM_OBJECT'
        EXPORTING
          object_name                  = lv_object_name
          object_type                  = 'REPS'
          versno                       = iv_versno
          iv_no_release_transformation = 'X'
        TABLES
          repos_tab                    = rt_abap
          trdir_tab                    = lt_trdir
        EXCEPTIONS
          no_version                   = 1
          OTHERS                       = 2.
    ELSE.
      ls_object_name-report = iv_report.
      ls_object_name-dynnr  = iv_dynpro.

      lv_object_name = ls_object_name.

      CALL FUNCTION 'SVRS_GET_VERSION_DYNP_40'
        EXPORTING
          object_name = lv_object_name
          versno      = iv_versno
        TABLES
          d022s_tab   = lt_d022s
        EXCEPTIONS
          OTHERS      = 1.

      CHECK sy-subrc IS INITIAL AND lt_d022s IS NOT INITIAL.

      APPEND LINES OF lt_d022s TO rt_abap.

    ENDIF.
  ENDMETHOD.                    "get_source_by_version

  METHOD search_abap_source.
    DATA:
      percentage     TYPE i,
      old_percentage TYPE i VALUE -1,
      text           TYPE c LENGTH 150.

    LOOP AT gt_object INTO gv_report.

      READ REPORT gv_report INTO gt_source. " this will get the source code
      IF sy-subrc IS NOT INITIAL.
        CONTINUE.
      ENDIF.

      search_source( ).

    ENDLOOP.

    FREE gt_object.

  ENDMETHOD.

  METHOD search_source.
    DATA:
      lt_source_vers  TYPE abaptxt255_tab,
      lv_string_found TYPE xfeld,
      lt_vrsd         TYPE STANDARD TABLE OF vrsd,
      ls_vrsd         LIKE LINE OF lt_vrsd,
      lv_number       TYPE i,
      lv_index        TYPE i,
      lt_results      TYPE match_result_tab,
      ls_result       LIKE LINE OF lt_results,
      ls_sstring      like line of sstring.

      lv_number = 1.

    DO lv_number TIMES.
      CLEAR lv_string_found.

      IF sy-index = 1.
        CLEAR ls_vrsd.
      ENDIF.

      LOOP AT sstring INTO ls_sstring. " no need for loop
        REFRESH lt_results.

          FIND ALL OCCURRENCES OF ls_sstring-low IN TABLE gt_source
            IN CHARACTER MODE
            IGNORING CASE
            RESULTS lt_results.

        CHECK lt_results IS NOT INITIAL.

        lv_string_found = gc_x.

        SORT lt_results BY line.
        DELETE ADJACENT DUPLICATES FROM lt_results COMPARING line.

        LOOP AT lt_results INTO ls_result.
          CALL METHOD get_hit_set
            EXPORTING
              iv_report = gv_report
              iv_dynpro = gv_dynpro
              it_abap   = gt_source
              iv_tabix  = ls_result-line
              iv_versno = ls_vrsd-versno.
        ENDLOOP.

      ENDLOOP.
      IF lv_string_found IS NOT INITIAL.
*       Add ALV header entry
        CLEAR gs_alv_header.

        gs_alv_header-repname = gv_report.
        gs_alv_header-dynnr   = gv_dynpro.
        gs_alv_header-versno  = ls_vrsd-versno.
        APPEND gs_alv_header TO gt_alv_header.

        IF gv_dynpro IS NOT INITIAL.
          gv_dynp_found = gc_x.
        ENDIF.

        IF ls_vrsd-versno IS NOT INITIAL.
          gv_vers_found = gc_x.
        ENDIF.
      ENDIF.
    ENDDO.

  ENDMETHOD.

  METHOD get_source_names.
    IF repname[] IS NOT INITIAL.

      SELECT name APPENDING TABLE gt_object
        FROM trdir
        WHERE name IN repname.
    ENDIF.

  ENDMETHOD.                    "get_source_names

  METHOD start.
    DATA:
     ls_sstring LIKE LINE OF sstring[].

    IF sstring[] IS INITIAL.
*     Please specifiy a search term
      MESSAGE s010(ZNYN_MESSAGE_CLASS) with 'Enter a search term' DISPLAY LIKE 'E'.
      RETURN.
    ENDIF.

    READ TABLE sstring[] INTO ls_sstring INDEX 1.
    IF lines( sstring[] ) = 1.
      gv_sstring = ls_sstring-low.
    ENDIF.

    get_source_names( ).

      TRY.
          search_abap_source( ).
        CATCH lcx_scan_exceptions.
          RETURN.
      ENDTRY.

    display( ).
  ENDMETHOD.                    "start

ENDCLASS.                    "lcl_source_scan IMPLEMENTATION

INITIALIZATION.
  CREATE OBJECT lo_sscan.

START-OF-SELECTION.
  lo_sscan->start( ).
 
*------------------------------------------------------------------------------------*
 
PROGRAM ZYNY_CASE_STUDY_SOURCE_SCAN.

TYPE-POOLS:
  SLIS,
  SSCR.

TABLES:
  D020S,                                                                " System Table TRDIR
  TRDIR.

CLASS:
  LCL_SOURCE_SCAN DEFINITION DEFERRED.

DATA:
  LO_SSCAN    TYPE REF TO LCL_SOURCE_SCAN,
  PLUSMINU(2) TYPE N VALUE 2,                                           " TO GET 2 LINES BEFORE AND AFTER OF FOUND STRING
  COMMENT     TYPE XFELD VALUE 'X'.

PARAMETERS : SSTRING TYPE TEXT255 DEFAULT 'start',                      " STRING SEARCH
             REPNAME TYPE TRDIR-NAME DEFAULT 'ZYNY_CASE_STUDY_SOURCE_SCAN'. " PROGRAM NAME

*----------------------------------------------------------------------*
*       CLASS lcx_scan_exceptions DEFINITION
*----------------------------------------------------------------------*
*       Exceptions for source scanning
*----------------------------------------------------------------------*
CLASS LCX_SCAN_EXCEPTIONS DEFINITION INHERITING FROM CX_STATIC_CHECK FINAL.
ENDCLASS.                    "lcx_scan_exceptions DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_source_scan DEFINITION
*----------------------------------------------------------------------*
*       ABAP source scanner
*----------------------------------------------------------------------*
CLASS LCL_SOURCE_SCAN DEFINITION FINAL.                                 " source scan class
  PUBLIC SECTION.
    METHODS:
      START.

    TYPES:
      BEGIN OF TY_LS_OBJNAME,
        REPORT TYPE SY-REPID,
        DYNNR  TYPE SY-DYNNR,
      END OF TY_LS_OBJNAME.

    DATA:
      GO_ALV        TYPE REF TO CL_SALV_HIERSEQ_TABLE,
      GV_HIT_COUNT  TYPE I,
      GV_SSTRING    TYPE STRING,
      GV_DYNP_FOUND TYPE XFELD,
      GV_VERS_FOUND TYPE XFELD,
      GS_OBJECT     TYPE TADIR-OBJ_NAME,
      GT_SOURCE     TYPE ABAPTXT255_TAB,
      GV_REPORT     TYPE SYREPID,

      BEGIN OF GS_ALV_HEADER,
        REPNAME TYPE TADIR-OBJ_NAME,
        EXPAND  TYPE XFELD,
      END OF GS_ALV_HEADER,

      GT_ALV_HEADER LIKE STANDARD TABLE OF GS_ALV_HEADER,

      BEGIN OF GS_ALV_ITEM,
        REPNAME    TYPE SY-REPID,
        LINE_NO    TYPE RSROW,
        TEXT       TYPE TEXT255,
        HIT        TYPE XFELD,
        CELL_COLOR TYPE LVC_T_SCOL,
      END OF GS_ALV_ITEM,

      GT_ALV_ITEM LIKE STANDARD TABLE OF GS_ALV_ITEM.

    CONSTANTS:
      GC_X TYPE XFELD VALUE 'X'.

    METHODS:
      ADD_TO_HITLIST
        IMPORTING
          IV_REPORT      TYPE CLIKE
          IV_SOURCE_LINE TYPE CLIKE
          IV_TABIX       TYPE SY-TABIX
          IV_HIT         TYPE XFELD,

      DISPLAY,

      GET_ALV_INSTANCE,

      GET_HIT_SET
        IMPORTING
          IV_REPORT TYPE CLIKE
          IT_ABAP   TYPE ABAPTXT255_TAB
          IV_TABIX  TYPE SY-TABIX,

      GET_SOURCE_NAMES,

      SEARCH_ABAP_SOURCE   RAISING LCX_SCAN_EXCEPTIONS,

      SEARCH_SOURCE        RAISING LCX_SCAN_EXCEPTIONS,

      SET_ALV_ATTRIBUTES.

ENDCLASS.                    "lcl_source_scan DEFINITION

CLASS LCL_SOURCE_SCAN IMPLEMENTATION.

  METHOD SET_ALV_ATTRIBUTES.
    DATA:
      LO_LAYOUT    TYPE REF TO CL_SALV_LAYOUT,
      LO_FUNCTIONS TYPE REF TO CL_SALV_FUNCTIONS_LIST,
      LO_LEVEL     TYPE REF TO CL_SALV_HIERSEQ_LEVEL,
      LO_COLUMN    TYPE REF TO CL_SALV_COLUMN_HIERSEQ,
      LO_COLUMNS   TYPE REF TO CL_SALV_COLUMNS_HIERSEQ,
      LT_COLUMNS   TYPE SALV_T_COLUMN_REF,
      LS_COLUMNS   LIKE LINE OF LT_COLUMNS,
      LO_SETTINGS  TYPE REF TO CL_SALV_DISPLAY_SETTINGS,
      LV_TITLE     TYPE LVC_TITLE,
      LV_HITS      TYPE LVC_TITLE,
      LS_COLOR     TYPE LVC_S_COLO,
      LS_LAYOUT    TYPE SALV_S_LAYOUT_KEY,
##NEEDED LT_FUNCTIONS TYPE SALV_T_UI_FUNC.

*   Layout
    LS_LAYOUT-REPORT = SY-REPID.
    LS_LAYOUT-HANDLE = 'SCAN'.

    LO_LAYOUT = GO_ALV->GET_LAYOUT( ).
    LO_LAYOUT->SET_KEY( LS_LAYOUT ).
    LO_LAYOUT->SET_SAVE_RESTRICTION( ).

*   Function keys/buttons
    LO_FUNCTIONS = GO_ALV->GET_FUNCTIONS( ).
    LO_FUNCTIONS->SET_ALL( GC_X ).

*   exclude the following functions (column paging buttons)
    LT_FUNCTIONS = LO_FUNCTIONS->GET_FUNCTIONS( ).

*   Display settings
    LO_SETTINGS = GO_ALV->GET_DISPLAY_SETTINGS( ).

*   Title
    LV_HITS = GV_HIT_COUNT.
    SHIFT LV_HITS LEFT DELETING LEADING SPACE.

    CONCATENATE LV_HITS
                'Treffer'(001)
                INTO LV_HITS SEPARATED BY SPACE.

    LV_TITLE = 'Source Scan für String:'(002).

    CONCATENATE LV_TITLE
                GV_SSTRING
                INTO LV_TITLE SEPARATED BY SPACE.

    CONCATENATE LV_TITLE
                LV_HITS
                INTO LV_TITLE SEPARATED BY ' - '.

    LO_SETTINGS->SET_LIST_HEADER( LV_TITLE ).

*   Field catalog
    TRY.
*       Field catalog/columns - header table
        LO_COLUMNS  = GO_ALV->GET_COLUMNS( '1' ).
        LT_COLUMNS = LO_COLUMNS->GET( ).

        TRY.
            LO_COLUMNS->SET_EXPAND_COLUMN( 'EXPAND' ).

            LO_LEVEL = GO_ALV->GET_LEVEL( '1' ).
            LO_LEVEL->SET_ITEMS_EXPANDED( GC_X ).

          CATCH CX_SALV_DATA_ERROR.
        ENDTRY.

        LOOP AT LT_COLUMNS INTO LS_COLUMNS.
          CASE LS_COLUMNS-COLUMNNAME.
            WHEN 'EXPAND'.
              LS_COLUMNS-R_COLUMN->SET_TECHNICAL( ).
          ENDCASE.
        ENDLOOP.

*       Field catalog/columns - item table
        LO_COLUMNS = GO_ALV->GET_COLUMNS( '2' ).

        TRY.
            LO_COLUMNS->SET_COLOR_COLUMN( 'CELL_COLOR' ).
          CATCH CX_SALV_DATA_ERROR.
        ENDTRY.

        LT_COLUMNS = LO_COLUMNS->GET( ).

        LOOP AT LT_COLUMNS INTO LS_COLUMNS.
          CASE LS_COLUMNS-COLUMNNAME.
            WHEN 'REPNAME'.
              LS_COLUMNS-R_COLUMN->SET_TECHNICAL( ).

            WHEN 'CELL_COLOR'.
              LS_COLUMNS-R_COLUMN->SET_TECHNICAL( ).

            WHEN 'HIT'.
              LS_COLUMNS-R_COLUMN->SET_TECHNICAL( ).

            WHEN 'LINE_NO'.
              LS_COLOR-COL = '4'.
              TRY.
                  LO_COLUMN ?= LS_COLUMNS-R_COLUMN.
                  LO_COLUMN->SET_COLOR( LS_COLOR ).
                  LO_COLUMN->SET_LEADING_ZERO( GC_X ).
                CATCH CX_SY_MOVE_CAST_ERROR.
              ENDTRY.

            WHEN 'TEXT'.
              TRY.
                  LO_COLUMN ?= LS_COLUMNS-R_COLUMN.
                  LO_COLUMN->SET_CELL_TYPE( IF_SALV_C_CELL_TYPE=>HOTSPOT ).
                CATCH CX_SY_MOVE_CAST_ERROR.
              ENDTRY.

          ENDCASE.
        ENDLOOP.
      CATCH CX_SALV_NOT_FOUND.
    ENDTRY.

  ENDMETHOD.                    "set_alv_attributes

  METHOD GET_ALV_INSTANCE.
    DATA:
      LT_ALV_BIND TYPE SALV_T_HIERSEQ_BINDING,    " Binding Between Two Tables
      LS_ALV_BIND LIKE LINE OF LT_ALV_BIND.

    LS_ALV_BIND-MASTER = LS_ALV_BIND-SLAVE = 'REPNAME'.
    APPEND LS_ALV_BIND TO LT_ALV_BIND.

    TRY.
        CALL METHOD CL_SALV_HIERSEQ_TABLE=>FACTORY
          EXPORTING
            T_BINDING_LEVEL1_LEVEL2 = LT_ALV_BIND
          IMPORTING
            R_HIERSEQ               = GO_ALV
          CHANGING
            T_TABLE_LEVEL1          = GT_ALV_HEADER
            T_TABLE_LEVEL2          = GT_ALV_ITEM.

      CATCH CX_SALV_DATA_ERROR.
      CATCH CX_SALV_NOT_FOUND.
    ENDTRY.

  ENDMETHOD.                    "get_alv_instance

  METHOD DISPLAY.

    IF GV_HIT_COUNT IS INITIAL.
      MESSAGE S010(ZNYN_MESSAGE_CLASS) WITH GV_SSTRING 'String not found' .
      RETURN.
    ENDIF.

    SORT GT_ALV_ITEM BY REPNAME LINE_NO HIT DESCENDING.
    DELETE ADJACENT DUPLICATES FROM GT_ALV_ITEM COMPARING REPNAME LINE_NO.

    GET_ALV_INSTANCE( ).
    CHECK GO_ALV IS NOT INITIAL.

    SET_ALV_ATTRIBUTES( ).

    GO_ALV->DISPLAY( ).

  ENDMETHOD.                    "display

  METHOD ADD_TO_HITLIST.
    DATA:
      LS_COL LIKE LINE OF GS_ALV_ITEM-CELL_COLOR.

    GS_ALV_ITEM-REPNAME = IV_REPORT.
    GS_ALV_ITEM-LINE_NO = IV_TABIX.
    GS_ALV_ITEM-TEXT    = IV_SOURCE_LINE.

    IF IV_HIT IS NOT INITIAL. " iv_hit represent the desired line containing desired string
      GS_ALV_ITEM-HIT = GC_X.
      ADD 1 TO GV_HIT_COUNT.
      LS_COL-FNAME     = 'TEXT'.
      LS_COL-COLOR-COL = '5'.
      APPEND LS_COL TO GS_ALV_ITEM-CELL_COLOR.
    ENDIF.

    APPEND GS_ALV_ITEM TO GT_ALV_ITEM.

    CLEAR GS_ALV_ITEM.
  ENDMETHOD.                    "add_to_hitlist

  METHOD GET_HIT_SET.
    DATA: LV_END     TYPE I,
          LV_START   TYPE I,
          LV_XTABIX  TYPE SY-TABIX,
          LV_HITLINE TYPE XFELD.

    FIELD-SYMBOLS:
      <LV_ABAP> TYPE ANY.

    LV_START = IV_TABIX - PLUSMINU .  " 2 line before
    LV_END   = IV_TABIX + PLUSMINU.   " 2 lines after

    IF LV_START < 1. "  edge cases
      LV_START = 1.
    ENDIF.

    WHILE LV_START <= LV_END.
      READ TABLE IT_ABAP ASSIGNING <LV_ABAP> INDEX LV_START.
      IF SY-SUBRC IS NOT INITIAL. " if failed then exit
        EXIT.
      ENDIF.

      LV_XTABIX = SY-TABIX. " also increase the line counter

      IF LV_START = IV_TABIX.
        LV_HITLINE = GC_X.    " marking the line where the desired string is found
      ELSE.
        CLEAR LV_HITLINE.
      ENDIF.

      ADD 1 TO LV_START.

      IF COMMENT IS NOT INITIAL.
        IF <LV_ABAP>(1) = '*'.
          IF  <LV_ABAP>(2) = '*{' OR <LV_ABAP>(2) = '*}'.
          ELSE.
            CONTINUE.
          ENDIF.
        ENDIF.
      ENDIF.

      CALL METHOD ADD_TO_HITLIST
        EXPORTING
          IV_REPORT      = IV_REPORT
          IV_SOURCE_LINE = <LV_ABAP>
          IV_TABIX       = LV_XTABIX
          IV_HIT         = LV_HITLINE.

    ENDWHILE.

  ENDMETHOD.                    "get_hit_set

  METHOD SEARCH_ABAP_SOURCE.
    READ REPORT GS_OBJECT INTO GT_SOURCE. " this will get the source code (REPORT KWY WORD EXCLUSIVELY)

    IF SY-SUBRC IS INITIAL.
      SEARCH_SOURCE( ).
    ENDIF.

    FREE GS_OBJECT.
  ENDMETHOD.

  METHOD SEARCH_SOURCE.
    DATA:
      LV_STRING_FOUND TYPE XFELD,
      LT_VRSD         TYPE STANDARD TABLE OF VRSD,
      LS_VRSD         LIKE LINE OF LT_VRSD,
      LT_RESULTS      TYPE MATCH_RESULT_TAB,
      LS_RESULT       LIKE LINE OF LT_RESULTS,
      LS_SSTRING      TYPE TEXT255.

    CLEAR LV_STRING_FOUND.

    CLEAR LS_VRSD.

    REFRESH LT_RESULTS.

    FIND ALL OCCURRENCES OF SSTRING IN TABLE GT_SOURCE    " now searching for the desired string in source code
        IN CHARACTER MODE
        IGNORING CASE
        RESULTS LT_RESULTS.

    CHECK LT_RESULTS IS NOT INITIAL. " if failed this will come out of method

    LV_STRING_FOUND = GC_X.   " flag is string is found

    SORT LT_RESULTS BY LINE.
    DELETE ADJACENT DUPLICATES FROM LT_RESULTS COMPARING LINE. " removing duplicates

    LOOP AT LT_RESULTS INTO LS_RESULT.
      CALL METHOD GET_HIT_SET
        EXPORTING
          IV_REPORT = GV_REPORT
          IT_ABAP   = GT_SOURCE
          IV_TABIX  = LS_RESULT-LINE.
    ENDLOOP.

    IF LV_STRING_FOUND IS NOT INITIAL. " if we got some data then create header for alv
*       Add ALV header entry
      CLEAR GS_ALV_HEADER.

      GS_ALV_HEADER-REPNAME = GV_REPORT.
      APPEND GS_ALV_HEADER TO GT_ALV_HEADER.
    ENDIF.

  ENDMETHOD.

  METHOD GET_SOURCE_NAMES.

    IF REPNAME IS NOT INITIAL.
      SELECT NAME INTO GS_OBJECT
        FROM TRDIR
        WHERE NAME EQ REPNAME.
      ENDSELECT.
    ENDIF.

  ENDMETHOD.                    "get_source_names

  METHOD START.
    DATA:
     LS_SSTRING TYPE TEXT255.       " char size 255

    IF SSTRING IS INITIAL.
*     Please specifiy a search term
      MESSAGE S010(ZNYN_MESSAGE_CLASS) WITH 'Enter a search term' DISPLAY LIKE 'E'.
      RETURN.
    ENDIF.

*   initializing local string and global variable
    LS_SSTRING = SSTRING.
    GV_SSTRING = SSTRING.                                   " class variable

    GET_SOURCE_NAMES( ).

    TRY.
        SEARCH_ABAP_SOURCE( ).
      CATCH LCX_SCAN_EXCEPTIONS.
        RETURN.
    ENDTRY.

    DISPLAY( ).
  ENDMETHOD.                    "start

ENDCLASS.                    "lcl_source_scan IMPLEMENTATION

INITIALIZATION.
  CREATE OBJECT LO_SSCAN.

START-OF-SELECTION.
  LO_SSCAN->START( ).
