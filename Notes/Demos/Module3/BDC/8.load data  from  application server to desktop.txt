*&---------------------------------------------------------------------*
*& Report ZRTC_BDC_FILE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrtc_bdc_file_download.

TYPES: BEGIN OF ty_mara,
         matnr TYPE matnr, " Material Number
         mbrsh TYPE mbrsh, " Industry sector
         mtart TYPE mtart, " Material TYPE
         maktx TYPE maktx, " MATERIAL DESC
         meins TYPE meins, " Base Unit of Measure
         matkl TYPE matkl, " Material Group
         kosch TYPE kosch,
       END OF ty_mara.


DATA : it_mara TYPE  TABLE OF ty_mara,
       wa_mara TYPE ty_mara,
       lv_file TYPE string.

OPEN DATASET 'ZRTC_FILE' FOR INPUT  IN TEXT MODE ENCODING DEFAULT.
"Load data from the file in Application server to internal table it_mara
DO .
  READ DATASET 'ZRTC_FILE' INTO wa_mara.
  IF sy-subrc  = 0.
    APPEND wa_mara TO it_mara.
    CLEAR wa_mara.
  ELSE.
    EXIT.
  ENDIF.
ENDDO.

CLOSE DATASET 'ZRTC_FILE'.

"Load  data from internal table it_mara to file p_file
CALL FUNCTION 'GUI_DOWNLOAD'
  EXPORTING
    filename              = 'C:\Users\rothomso\Desktop\Data.txt'
    filetype              = 'ASC'
    write_field_separator = 'X'
  TABLES
    data_tab              = it_mara

  .
IF sy-subrc = 0.
  WRITE : 'The file is downloaded from Application server to your Desktop'.
* Implement suitable error handling here
ENDIF.