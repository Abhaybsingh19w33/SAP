*&---------------------------------------------------------------------*
*& Report ZYNY_WRITE_EXCEL_TO_PRES_SERV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZYNY_WRITE_EXCEL_TO_PRES_SERV.

*Link - https://discoveringabap.com/2022/07/25/abap-code-samples-write-excel-file-to-presentation-server/

*In this post you will learn to write Excel file to Presentation Server 
*i.e. your laptop or desktop. Simply put – how to download internal 
*table to Excel File from ABAP.

*Earlier post ABAP Code Samples : Read Excel File from Presentation 
*Server covered the upload part. This will cover the download part.

*Link - https://discoveringabap.com/2022/07/20/abap-code-samples-read-excel-files-from-presentation-server/

TYPES: BEGIN OF xls_line,
         data(256) TYPE x,
       END OF xls_line.

DATA : lt_bin_data TYPE STANDARD TABLE OF xls_line.

SELECT * FROM sflight INTO TABLE @DATA(lt_flights).
IF sy-subrc EQ 0.

  GET REFERENCE OF lt_flights INTO DATA(lr_data_ref).
  DATA(lv_xstring) = zcl_itab_to_excel=>itab_to_excel_xstring( 
lr_data_ref ).

  CALL FUNCTION 'SCMS_XSTRING_TO_BINARY'
    EXPORTING
      buffer     = lv_xstring
    TABLES
      binary_tab = lt_bin_data.

  cl_gui_frontend_services=>gui_download(
    EXPORTING
    filename = CONV #( iv_file )
    filetype = 'BIN'
    IMPORTING
      filelength = DATA(lv_len)
    CHANGING
      data_tab = lt_bin_data
    ).
ENDIF.

*A method itab_to_excel_xstring is used here. The code is as below.

*Class Definition and Implementation

CLASS zcl_itab_to_excel DEFINITION PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS:
      itab_to_excel_xstring 
        IMPORTING ir_data_ref       TYPE REF TO data
        RETURNING VALUE(rv_xstring) TYPE xstring.
ENDCLASS.

CLASS zcl_itab_to_excel IMPLEMENTATION.
  METHOD itab_to_excel_xstring.

    FIELD-SYMBOLS: <fs_data> TYPE ANY TABLE.

    CLEAR rv_xstring.
    ASSIGN ir_data_ref->* TO <fs_data>.

    TRY.
        cl_salv_table=>factory(
          IMPORTING r_salv_table = DATA(lo_table)
          CHANGING  t_table      = <fs_data> ).
  
        DATA(lt_fcat) = 
          cl_salv_controller_metadata=>get_lvc_fieldcatalog(
            r_columns      = lo_table->get_columns( )
            r_aggregations = lo_table->get_aggregations( ) ).

        DATA(lo_result) =
          cl_salv_ex_util=>factory_result_data_table( 
            r_data         = ir_data_ref
            t_fieldcatalog = lt_fcat ).

        cl_salv_bs_tt_util=>if_salv_bs_tt_util~transform(
          EXPORTING
            xml_type      = if_salv_bs_xml=>c_type_xlsx
            xml_version   = cl_salv_bs_a_xml_base=>get_version( )
            r_result_data = lo_result
            xml_flavour   = if_salv_bs_c_tt=>c_tt_xml_flavour_export
            gui_type      = if_salv_bs_xml=>c_gui_type_gui
          IMPORTING
            xml           = rv_xstring ).
      CATCH cx_root.
        CLEAR rv_xstring.
    ENDTRY.
  ENDMETHOD.
ENDCLASS.

*The downloaded Excel file may give below error in some cases – however 
*when you click Yes the Excel opens up correctly.

*Link - https://discoveringabap.com/wp-content/uploads/2022/07/image-58.png?ezimgfmt=ng:webp/ngcb2

*Link - https://discoveringabap.com/wp-content/uploads/2022/07/image-59.png?w=2044&ezimgfmt=ng:webp/ngcb2

*As mentioned in earlier blogs of this series – a better solution is to 
*use the ABAP2XLSX open source project. It can be found on github at 
*link – https://github.com/abap2xlsx/abap2xlsx