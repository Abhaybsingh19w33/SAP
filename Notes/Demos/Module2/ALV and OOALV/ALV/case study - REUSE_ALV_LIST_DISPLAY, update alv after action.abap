REPORT ZYNY_CASE_STUDY_00.

*----------------------------------------------------------------------*
*       SET PF-STATUS
*----------------------------------------------------------------------*
SET PF-STATUS 'ZSTANDARD'. " PF STATUS FOR DOWN ARROW BUTTON IN TOOLBAR

*----------------------------------------------------------------------*
*       CLASS cl_case_study DEFINITION
*----------------------------------------------------------------------*
CLASS CL_CASE_STUDY DEFINITION.
  PUBLIC SECTION.
    METHODS : GET_DATA IMPORTING ROW_COUNT TYPE I, " row_count, number of records intended to retreive from data table
              create_field_catalog,                " populate field catalog
              DISPLAY_LIST_ALV.                    " display list alv
ENDCLASS.

*----------------------------------------------------------------------*
*       TYPE DECLARATION
*----------------------------------------------------------------------*
TYPES : BEGIN OF TY_TAB,
          MATNR TYPE MARA-MATNR,  " Material Number
          ERSDA TYPE MARA-ERSDA,  " Created On
          ERNAM TYPE MARA-ERNAM,  " Name of Person who Created the Object
          PSTAT TYPE MARA-PSTAT,  " Maintenance status
        END OF TY_TAB.

*----------------------------------------------------------------------*
*       DATA DECLARATION
*----------------------------------------------------------------------*
DATA: CLICK_COUNT TYPE I VALUE 0. " variable to strore the count/ index of the row printed on top

DATA: IT_TAB TYPE TABLE OF TY_TAB," internal table
      WA_TAB TYPE TY_TAB.         " work area

DATA: IT_fieldcat TYPE slis_t_fieldcat_alv, " field catalog internal table
      WA_fieldcat TYPE slis_fieldcat_alv.   " field catalog work area

DATA: CL_OBJECT TYPE REF TO CL_CASE_STUDY. " object of case study

" ----------------------------------------------------------------------*
       START-OF-SELECTION
" ----------------------------------------------------------------------*
START-OF-SELECTION.
  SET PF-STATUS 'ZSTANDARD'.
  CREATE OBJECT CL_OBJECT.                    " initiating object

  CL_OBJECT->GET_DATA( 10 ).                  " get 10 rows from mara table
  CL_OBJECT->create_field_catalog( ).         " populate field catalog
  CL_OBJECT->DISPLAY_LIST_ALV( ).             " display list alv

*----------------------------------------------------------------------*
*       FORM ADD_FIELD  TO ADD FIELD IN FIELD CATALOG
*----------------------------------------------------------------------*
FORM add_field USING fROW_pos TYPE i
                     fcol_pos TYPE i
                     fname TYPE string
                     fseltext_l TYPE string
               CHANGING IT_fieldcat TYPE slis_t_fieldcat_alv.

  CLEAR WA_fieldcat.
  WA_fieldcat-ROW_pos = FROW_POS.
  WA_fieldcat-col_pos = FCOL_POS.
  WA_fieldcat-fieldname = fname.
  WA_fieldcat-seltext_l = fseltext_l.
  APPEND WA_fieldcat TO IT_fieldcat.
ENDFORM.

*----------------------------------------------------------------------*
*       USER_COMMAND
*----------------------------------------------------------------------*
FORM USER_COMMAND USING r_ucomm LIKE sy-ucomm
                        rs_selfield TYPE slis_selfield.
    CASE r_ucomm.
      WHEN 'TRAVERSE'.                             " TRAVERSE COMMAND, WHEN TRAVERSE BUTTON IS CLICKED
        IF lines( IT_tab ) > 1.                    " WHEN NUMBER OF RECORDS IN INTERNAL TABLE IS GREATER THAN 1
          CLICK_COUNT = CLICK_COUNT + 1.           " variable to strore the count/ index of the row printed on top

          PERFORM TRAVERSE USING CLICK_COUNT.

          rs_selfield-refresh = abap_true.         " TO REFRESH ALV LIST
        ENDIF.
    ENDCASE.
ENDFORM.

*----------------------------------------------------------------------*
*       FORM TRAVERSE
*----------------------------------------------------------------------*
FORM TRAVERSE USING CLICK_COUNT TYPE I.
    READ TABLE IT_TAB INDEX CLICK_COUNT INTO WA_TAB. " RETREIVE RECORD FROM INTERNAL TABLE WHICH IS AT INDEX 'CLICK_COUNT'

    DELETE TABLE IT_TAB FROM WA_TAB.                 " REMOVE THAT RECORD FROM INTERNAL TABLE

    INSERT WA_TAB INTO IT_TAB INDEX 1.               " THEN INSERT THAT RECORD AT TOP OF INTERNAL TABLE
ENDFORM.

*----------------------------------------------------------------------*
*       CLASS CL_CASE_STUDY IMPLEMENTATION
*----------------------------------------------------------------------*
CLASS CL_CASE_STUDY IMPLEMENTATION.
  " Get data from mara
  METHOD GET_DATA.
    SELECT MATNR ERSDA ERNAM PSTAT FROM MARA INTO TABLE IT_TAB UP TO ROW_COUNT ROWS.
  ENDMETHOD.

  " populate field catalog
  method create_field_catalog.
    PERFORM ADD_FIELD USING '1' '1' 'MATNR' 'MATNR' CHANGING IT_fieldcat.
    PERFORM ADD_FIELD USING '1' '2' 'ERSDA' 'ERSDA' CHANGING IT_fieldcat.
    PERFORM ADD_FIELD USING '1' '3' 'ERNAM' 'ERNAM' CHANGING IT_fieldcat.
    PERFORM ADD_FIELD USING '1' '4' 'PSTAT' 'PSTAT' CHANGING IT_fieldcat.
  ENDMETHOD.

  " display list alv
  METHOD DISPLAY_LIST_ALV.
    CALL FUNCTION 'REUSE_ALV_LIST_DISPLAY'
     EXPORTING
          i_callback_program = sy-repid             " current program name
          i_callback_pf_status_set = 'ZSTANDARD'    " pf status for list alv
          it_fieldcat = IT_fieldcat                 " field catalog
          i_callback_user_command = 'USER_COMMAND'  " user command
     TABLES
          t_outtab = IT_TAB.                        " data table
  ENDMETHOD.
ENDCLASS.