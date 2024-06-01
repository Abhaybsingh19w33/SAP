*&---------------------------------------------------------------------*
*& Report ZYNY_READ_EXCEL_FROM_APPL_SERV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZYNY_READ_EXCEL_FROM_APPL_SERV.

*Link - https://discoveringabap.com/2022/07/20/abap-code-samples-read-excel-files-from-application-server/

*In this post you will learn how to Read Excel File from Application 
*Server. This solution covers reading the data from Excel File tabs as 
*well.

*Step 1 : Read the file from application server into xstring.

*Important to note that the file should be read in binary mode.

DATA(lv_file) = 'path/file.xlsx'.
OPEN DATASET lv_file FOR INPUT IN BINARY MODE.
IF sy-subrc EQ 0.
  READ DATASET lv_file INTO lv_xls_xstr.
  IF sy-subrc NE 0.
    MESSAGE e002 WITH lv_file.
  ENDIF.
ELSE.
  MESSAGE e001 WITH lv_file.
ENDIF.
CLOSE DATASET lv_file.

*Step 2 : Get the Excel Sheet names

*CL_FDT_XL_SPREADSHEET class is used to get the sheet names and get the 
*data from specific sheet.

"Create object for cl_fdt_xl_spreadsheet
DATA(lo_xls) = NEW cl_fdt_xl_spreadsheet( document_name = iv_file
                                          xdocument     = lv_xls_xstr ).

"Get work sheets
lo_xls->if_fdt_doc_spreadsheet~get_worksheet_names( 
  IMPORTING 
    worksheet_names = DATA(lt_sheets) 
).

*Step 3 : Read the sheet data

"Loop at sheets & get data using a method from the class
LOOP AT lt_sheets INTO DATA(ls_sheet).
  ir_data_ref = lo_xls->if_fdt_doc_spreadsheet~get_itab_from_worksheet(
 ls_sheet  ) .
  ASSIGN ir_data_ref->* TO FIELD-SYMBOL(<lfs_data_tab>).
  cl_demo_output=>display( <lfs_data_tab> ).
ENDLOOP.

*This part of code will read each sheet and display with the demo 
*output class.

*It is important to note that

*-> the column names from the table are A, B, C, D … and so on
*-> the actual column header from the excel file are shown as the first line

*This is a effective method which allows us to read Excel file. However,
* this comes at a risk. SAP suggests to use this class only within BRF+ 
*framework and not outside. See the note below for the warning.

*Note 2468709 – Usage of standard class CL_FDT_XL_SPREADSHEET
*Link - https://launchpad.support.sap.com/

*The solution to this issue is to use the ABAP2XLSX open source 
*project. It can be found on github at below links.

*https://github.com/abap2xlsx/abap2xlsx