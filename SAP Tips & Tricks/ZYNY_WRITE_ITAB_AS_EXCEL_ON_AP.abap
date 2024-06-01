*&---------------------------------------------------------------------*
*& Report ZYNY_WRITE_ITAB_AS_EXCEL_ON_AP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZYNY_WRITE_ITAB_AS_EXCEL_ON_AP.

*Link - https://discoveringabap.com/2021/11/08/abap-code-samples-write-internal-table-as-excel-file-on-sap-application-server/

*This is a code sample for writing a internal table as an excel file to 
*application server i.e. AL11.

*Class Definition and Implementation

CLASS zcl_itab_to_excel DEFINITION PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      itab_to_xstring 
        IMPORTING ir_data_ref       TYPE REF TO data
        RETURNING VALUE(rv_xstring) TYPE xstring.
ENDCLASS.

CLASS zcl_itab_to_excel IMPLEMENTATION.
  METHOD itab_to_xstring.

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

*Code to call the method
*To call the method we need to pass the reference of the table. So for 
*example, let us select data from SBOOK table and try to write it as 
*excel on AL11.

REPORT zjp_excel.

SELECT * FROM sbook INTO TABLE @DATA(it_out_rec).
DATA(lv_xls_file) = '/tmp/Bookings.xlsx'.

GET REFERENCE OF it_out_rec INTO DATA(lo_data_ref).
DATA(lv_xstring) = NEW zcl_itab_to_excel( )->itab_to_xstring( 
lo_data_ref ).
OPEN DATASET lv_xls_file FOR OUTPUT IN BINARY MODE.
IF sy-subrc EQ 0.
  TRANSFER lv_xstring TO lv_xls_file.
  CLOSE DATASET lv_xls_file.
ENDIF.

*On execution the file gets written.

*Important
*If you try to download the file from AL11 or using CG3Z, the file 
*won’t be downloaded correctly and you can not open it as an excel 
*document.

*However, you can download this using any FTP client or ask your 
*friends in Basis to do it – you can get a correct excel file as below.

*Link - https://discoveringabap.com/ezoimgfmt/discoveringabap.files.wordpress.com/2021/11/image-25.png?ezimgfmt=ng:webp/ngcb2