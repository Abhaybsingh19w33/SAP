*&---------------------------------------------------------------------*
*& Report ZYNY_READ_EXCEL_FROM_PRES_SERV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZYNY_READ_EXCEL_FROM_PRES_SERV.

*Link - https://discoveringabap.com/2022/07/20/abap-code-samples-read-excel-files-from-presentation-server/

*In this post you will learn how to read Excel File from Presentation 
*server.

*Read Excel File from Presentation Server

*Option 1 : Use FM ALSM_EXCEL_TO_INTERNAL_TABLE

*Below code would upload xlsx file from presentation server i.e. your 
*laptop / desktop. This also includes example of how to handle date 
*conversion and decimal places for amount.

*Sample File

*Click to see the sample Excel File : Test.xlsx
*Link - https://discoveringabap.files.wordpress.com/2022/07/test.xlsx

  DATA : lt_data    TYPE STANDARD TABLE OF alsmex_tabline,
         lt_flights TYPE STANDARD TABLE OF sflight,
         ls_flight  TYPE sflight,
         lv_file    TYPE string VALUE 'C:\Demo\Test.xlsx'.

  CALL FUNCTION 'ALSM_EXCEL_TO_INTERNAL_TABLE'
    EXPORTING
      filename                = CONV localfile( lv_file )
      i_begin_col             = 1
      i_begin_row             = 2
      i_end_col               = 9999
      i_end_row               = 9999
    TABLES
      intern                  = lt_data
    EXCEPTIONS
      inconsistent_parameters = 1
      upload_ole              = 2
      OTHERS                  = 3.
  IF sy-subrc <> 0.
    "Error
  ELSE.

    LOOP AT lt_data INTO DATA(ls_data).
      ASSIGN COMPONENT ls_data-col OF STRUCTURE ls_flight TO 
FIELD-SYMBOL(<lfs_fld>).

      CASE ls_data-col.
        when 4. "Convert Date
          if strlen( ls_data-value ) = 10.
            ls_data-value = |{ ls_data-value+6(4) }{ ls_data-value+3(2)
 }{ ls_data-value(2) }|.
          else.
            ls_data-value = sy-datum.
          endif.
        when 5 or 10. "Handle Decimal place
          REPLACE all OCCURRENCES OF '.' IN ls_data-value WITH ''.
          REPLACE all OCCURRENCES OF ',' IN ls_data-value WITH '.'.
      ENDCASE.

      <lfs_fld> = ls_data-value.
      AT END OF row.
        APPEND ls_flight TO lt_flights.
      ENDAT.
    ENDLOOP.

    cl_demo_output=>display( lt_flights ).

  ENDIF.
  
*However, in this option we can not read the data from a specific tab 
*and if the file has multiple tabs it is not possible to manage the 
*data upload using this method.

*Option 2 : Using class cl_fdt_xl_spreadsheet

 TYPES: BEGIN OF xls_line,
           data(256) TYPE x,
         END OF xls_line.

  DATA : lt_bin_data TYPE STANDARD TABLE OF xls_line,
         lv_file     TYPE string VALUE 'C:\Demo\Test.xlsx'.

  cl_gui_frontend_services=>gui_upload(
    EXPORTING
      filename = lv_file
      filetype = 'BIN'
    IMPORTING
      filelength = DATA(lv_file_length)
      header   = DATA(lv_xstring_header)
    CHANGING
      data_tab = lt_bin_data
    EXCEPTIONS
      OTHERS = 99 ).

  "CALL FUNCTION 'SCMS_BINARY_TO_XSTRING'
  CALL FUNCTION 'SCMS_BINARY_TO_XSTRING'
    EXPORTING
      input_length = lv_file_length
    IMPORTING
      buffer       = lv_xstring_header
    TABLES
      binary_tab   = lt_bin_data
    EXCEPTIONS
      failed       = 1
      OTHERS       = 2.
  IF sy-subrc = 0.

    TRY.
        DATA(lo_excel) = NEW cl_fdt_xl_spreadsheet(
                       document_name = iv_file
                       xdocument     = lv_xstring_header ) .

        lo_excel->if_fdt_doc_spreadsheet~get_worksheet_names(
          IMPORTING
            worksheet_names = DATA(lt_worksheets) ).

        DATA(lv_woksheetname) = lt_worksheets[ 1 ].  "Read first sheet
        DATA(lo_data_ref) = 
lo_excel->if_fdt_doc_spreadsheet~get_itab_from_worksheet(
                                         lv_woksheetname ).

        ASSIGN lo_data_ref->* TO FIELD-SYMBOL(<lfs_data_tab>).
        cl_demo_output=>display( <lfs_data_tab> ).

      CATCH cx_fdt_excel_core.
       "Error handling
    ENDTRY.

  ENDIF.
  
*This is a effective method which allows us to read Excel file. However, 
*this comes at a risk. SAP suggests to use this class only within BRF+ 
*framework and not outside. See the note below for the warning.
  
*Note 2468709 – Usage of standard class CL_FDT_XL_SPREADSHEET
*Link - https://launchpad.support.sap.com/

*The solution to this issue is to use the ABAP2XLSX open source 
*project. It can be found on github at below links.

*https://github.com/abap2xlsx/abap2xlsx