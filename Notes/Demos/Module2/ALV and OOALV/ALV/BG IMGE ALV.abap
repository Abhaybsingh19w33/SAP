
*&---------------------------------------------------------------------*
*& Report ZTEST_NP_EDIT_SALV
*& Overcome the restriction of the SALV model using the power of the
*& Object Oriented ABAP
*&---------------------------------------------------------------------*
REPORT ztest_np_edit_salv.
*----------------------------------------------------------------------*
* Define the Local class inheriting from the CL_SALV_MODEL_LIST
* to get an access of the model, controller and adapter which inturn
* provides the Grid Object
*----------------------------------------------------------------------*
CLASS lcl_salv_model DEFINITION INHERITING FROM cl_salv_model_list.
    PUBLIC SECTION.
    DATA:   o_control TYPE REF TO cl_salv_controller_model,
            o_adapter TYPE REF TO cl_salv_adapter.
    METHODS:
            grabe_model
                IMPORTING
                io_model TYPE REF TO cl_salv_model,
            grabe_controller,
            grabe_adapter.
    PRIVATE SECTION.
    DATA: lo_model TYPE REF TO cl_salv_model.
ENDCLASS. "LCL_SALV_MODEL DEFINITION

*----------------------------------------------------------------------*
* Event handler for the added buttons
*----------------------------------------------------------------------*
CLASS lcl_event_handler DEFINITION.
    PUBLIC SECTION.
    METHODS:
        on_user_command FOR EVENT added_function OF cl_salv_events
            IMPORTING e_salv_function.
ENDCLASS. "lcl_event_handler DEFINITION

*----------------------------------------------------------------------*
* Local Report class - Definition
*----------------------------------------------------------------------*
CLASS lcl_report DEFINITION.
    PUBLIC SECTION.
    TYPES: ty_t_sflights TYPE STANDARD TABLE OF sflights.
    DATA: t_data TYPE ty_t_sflights.
    DATA: o_salv TYPE REF TO cl_salv_table.
    DATA: o_salv_model TYPE REF TO lcl_salv_model.
    METHODS:
        get_data,
        generate_output.
ENDCLASS. "lcl_report DEFINITION

*----------------------------------------------------------------------*
* Global data
*----------------------------------------------------------------------*
DATA: lo_report TYPE REF TO lcl_report.

*----------------------------------------------------------------------*
* Start of selection
*----------------------------------------------------------------------*
START-OF-SELECTION.
    CREATE OBJECT lo_report.
    lo_report->get_data( ).
    lo_report->generate_output( ).

*----------------------------------------------------------------------*
* Local Report class - Implementation
*----------------------------------------------------------------------*
CLASS lcl_report IMPLEMENTATION.
    METHOD get_data.
* test data
        SELECT * FROM sflights
        INTO TABLE me->t_data
        UP TO 30 ROWS.
    ENDMETHOD. "get_data

    METHOD generate_output.
*...New ALV Instance ...............................................
        TRY.
            cl_salv_table=>factory(
            EXPORTING
*               r_container = w_alv1
                list_display = abap_false
            IMPORTING
                r_salv_table = o_salv
            CHANGING
                t_table = t_data ).
        CATCH cx_salv_msg. "#EC NO_HANDLER
        ENDTRY.

*...PF Status.......................................................
* Add MYFUNCTION from the report SALV_DEMO_TABLE_EVENTS
        o_salv->set_screen_status(
            pfstatus = 'SALV_STANDARD'
            REPORT = 'SALV_DEMO_TABLE_EVENTS'
            set_functions = o_salv->c_functions_all ).

*...Event handler for the button.....................................
        DATA:   lo_events TYPE REF TO cl_salv_events_table,
                lo_event_h TYPE REF TO lcl_event_handler.
* event object
        lo_events = o_salv->get_event( ).
* event handler
        CREATE OBJECT lo_event_h.
* setting up the event handler
        SET HANDLER lo_event_h->on_user_command FOR lo_events.

*...Get Model Object ...............................................
        DATA: lo_alv_mod TYPE REF TO cl_salv_model.
* Narrow casting
        lo_alv_mod ?= o_salv.
* object for the local inherited class from the CL_SALV_MODEL_LIST
        CREATE OBJECT o_salv_model.
* grabe model to use it later
        CALL METHOD o_salv_model->grabe_model
        EXPORTING
            io_model = lo_alv_mod.
*...Generate ALV output ...............................................
        o_salv->display( ).
    ENDMETHOD. "generate_output
ENDCLASS. "lcl_report IMPLEMENTATION
*----------------------------------------------------------------------*
* LCL_SALV_MODEL implementation
*----------------------------------------------------------------------*
CLASS lcl_salv_model IMPLEMENTATION.
    METHOD grabe_model.
*       save the model
        lo_model = io_model.
    ENDMETHOD. "grabe_model
    
    METHOD grabe_controller.
*       save the controller
        o_control = lo_model->r_controller.
    ENDMETHOD. "grabe_controller
    
    METHOD grabe_adapter.
*       save the adapter from controller
        o_adapter ?= lo_model->r_controller->r_adapter.
    ENDMETHOD. "grabe_adapter
ENDCLASS. "LCL_SALV_MODEL IMPLEMENTATION
*----------------------------------------------------------------------*
* Event Handler for the SALV
*----------------------------------------------------------------------*
CLASS lcl_event_handler IMPLEMENTATION.
    METHOD on_user_command.
        DATA:   lo_grid TYPE REF TO cl_gui_alv_grid,
                lo_full_adap TYPE REF TO cl_salv_fullscreen_adapter.
        DATA:   ls_layout TYPE lvc_s_layo.
        CASE e_salv_function.
* Make ALV as Editable ALV
                WHEN 'MYFUNCTION'.
* Contorller
                CALL METHOD lo_report->o_salv_model->grabe_controller.
* Adapter
                CALL METHOD lo_report->o_salv_model->grabe_adapter.
* Fullscreen Adapter (Down Casting)
                lo_full_adap ?= lo_report->o_salv_model->o_adapter.
* Get the Grid
                lo_grid = lo_full_adap->get_grid( ).
* Got the Grid .. ?
                IF lo_grid IS BOUND.
* Editable ALV
                        ls_layout-edit = 'X'.
* Set the front layout of ALV
                        CALL METHOD lo_grid->set_frontend_layout
                        EXPORTING
                                is_layout = ls_layout.
* refresh the table
                        CALL METHOD lo_grid->refresh_table_display.
                ENDIF.
        ENDCASE.
    ENDMETHOD. "on_user_command
ENDCLASS. "lcl_event_handler IMPLEMENTATION

* Code comes before the calling the Display method of SALV
* O_SALV->DISPLAY( )
*...Header.......... ...............................................
DATA:   lo_header TYPE REF TO cl_salv_form_layout_grid,
        lo_h_label TYPE REF TO cl_salv_form_label,
        lo_h_flow TYPE REF TO cl_salv_form_layout_flow.
* header object CREATE OBJECT lo_header.
* information in Bold
        lo_h_label = lo_header->create_label( row = 1 COLUMN = 1 ).
        lo_h_label->set_text( 'Header in Bold' ).

* information in tabular format
lo_h_flow = lo_header->create_flow( row = 2 COLUMN = 1 ).
lo_h_flow->create_text( text = 'This is text of flow' ).
* set the top of list using the header for Online.
o_salv->set_top_of_list( lo_header ).

" Set the background wallpaper by accessing the GRID and TOP-of-LIST object

* Code comes in the event handler of the added button.
* Get the Grid
lo_grid = lo_full_adap->get_grid( ).
* Got the Grid.. ?
IF lo_grid IS BOUND.
    DATA:   lo_form_tol TYPE REF TO cl_salv_form,
            lo_dydos TYPE REF TO cl_salv_form_dydos.
* Get the Top of list object using the adapter
    CALL FUNCTION 'GET_GLOBALS_FROM_SLVC_FULLSCR'
    EXPORTING
        ir_salv_fullscreen_adapter = lo_full_adap
    IMPORTING
        er_form_tol = lo_form_tol.
* Got the Top Of List object.. ?
    IF lo_form_tol IS BOUND.
* get the object using the Wide Casting
        lo_dydos ?= lo_form_tol.
* set the wallpaper
        lo_dydos->set_wallpaper( 'ALV_BACKGROUND' ).
* refresh the table
        CALL METHOD lo_grid->refresh_table_display.
    ENDIF.
ENDIF.