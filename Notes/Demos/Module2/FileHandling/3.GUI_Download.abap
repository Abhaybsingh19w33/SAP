REPORT ZAT_FILE3.
"downloading from internal table to desktop

TYPES: BEGIN OF ty_mara,
         matnr TYPE matnr, " Material Number
         mbrsh TYPE mbrsh, " Industry sector
         mtart TYPE mtart, " Material TYPE
         meins TYPE meins, " Base Unit of Measure
         matkl TYPE matkl, " Material Group

       END OF ty_mara.


DATA : it_mara TYPE  TABLE OF ty_mara,
       wa_mara TYPE ty_mara,
       lv_file TYPE string.

tables :mara.
SELECT-OPTIONS :s_matnr for mara-matnr.

select   MATNR
         MBRSH
         MTART
         MEINS
         MATKL
   from mara into  table it_mara where matnr in s_matnr.


"Load  data from internal table it_mara to file p_file
CALL FUNCTION 'GUI_DOWNLOAD'
  EXPORTING
    filename              = 'C:\Users\athomson\Documents\SAP\SAP GUI\Module 2\File handling\Data1.txt'
    filetype              = 'ASC'
    write_field_separator = '*'
*    append = 'X'
  TABLES
    data_tab              = it_mara

  .
IF sy-subrc = 0.
  WRITE : 'data  is downloaded  to your Desktop'.
* Implement suitable error handling here
ENDIF.