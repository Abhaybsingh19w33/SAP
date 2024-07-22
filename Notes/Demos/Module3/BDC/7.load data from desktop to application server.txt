*&---------------------------------------------------------------------*
*& Report ZRTC_BDC_FILE
*&---------------------------------------------------------------------*
*& file 
zxyz13	kuna	name1	sear1	123456	mumbai	123456	IN
zxyz14	kuna	name1	sear1	123456	mumbai	123456	IN
zxyz15	kuna	name1	sear1	123456	mumbai	123456	IN
zxyz17	kuna	name1	sear1	123456	mumbai	123456	IN

*&---------------------------------------------------------------------*
REPORT zrtc_bdc_file.

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

PARAMETERS : p_file TYPE rlgrap-filename.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.

  CALL FUNCTION 'F4_FILENAME'
    EXPORTING
      program_name  = syst-cprog
      dynpro_number = syst-dynnr
*     FIELD_NAME    = ' '
    IMPORTING
      file_name     = p_file.

START-OF-SELECTION.

  lv_file = p_file .
  "From Desktop to internal table in SAP
  CALL FUNCTION 'GUI_UPLOAD'
    EXPORTING
      filename            = lv_file
      filetype            = 'ASC'
      has_field_separator = 'x'
    TABLES
      data_tab            = it_mara.

  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

  OPEN DATASET 'ZRTC_FILE' FOR OUTPUT IN TEXT MODE ENCODING DEFAULT.

  "From internal table to file in application server.
  LOOP AT it_mara INTO wa_mara.

    TRANSFER wa_mara  TO 'ZRTC_FILE'.
    CLEAR wa_mara.
  ENDLOOP.

  CLOSE DATASET 'ZRTC_FILE'.