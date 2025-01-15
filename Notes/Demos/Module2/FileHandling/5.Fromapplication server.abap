*&---------------------------------------------------------------------*
*& Report ZRT_FROMAPPLICATIONSEVER_FILE4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZRT_FROMAPPLICATIONSEVER_FILE4.

TYPES: BEGIN OF TY_MARA,
         MATNR TYPE MATNR, " Material Number
         MBRSH TYPE MBRSH, " Industry sector
         MTART TYPE MTART, " Material TYPE
         MAKTX TYPE MAKTX, " MATERIAL DESC
         MEINS TYPE MEINS, " Base Unit of Measure
         MATKL TYPE MATKL, " Material Group

       END OF TY_MARA.

DATA : it_mara TYPE  TABLE OF ty_mara,
       wa_mara TYPE ty_mara,
       lv_file TYPE string.



OPEN DATASET 'ZRTC_FILE' FOR INPUT  IN TEXT MODE ENCODING DEFAULT.
"INPUT : means u are going to read from the file
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
    filename              = 'C:\Users\rothomso\Desktop\Data_downloaded.txt'
    filetype              = 'ASC'
    APPEND                ='X'
    write_field_separator = 'X'
  TABLES
    data_tab              = it_mara

  .
IF sy-subrc = 0.
  WRITE : 'The file is downloaded from Application server to your Desktop.check if file is created on your desktop'.
* Implement suitable error handling here
ENDIF.