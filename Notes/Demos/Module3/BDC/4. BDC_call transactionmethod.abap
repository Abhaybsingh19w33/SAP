*&---------------------------------------------------------------------*
*& Report ZRTC_BDC
*&---------------------------------------------------------------------*
*&file 
V2115	1	FERT	SHORTDESC	KG	02	PA
V2119	1	FERT	SHORTDESC	KG	02	PA
V2117	1	FERT	SHORTDESC	KG	02	PA
V2118	1	FERT	SHORTDESC	KG	02	PA
*&---------------------------------------------------------------------*

REPORT zrtc_bdc_calltrans.


TYPES : BEGIN OF ty_mara,
          matnr TYPE matnr,
          mbrsh TYPE mbrsh,  " Industry sector
          mtart TYPE mtart,  " Material type
          maktx TYPE maktx,  " MAT DESCR
          meins TYPE meins,  " Base Unit of Measure
          matkl TYPE matkl,  " MAT GRP
          kosch TYPE kosch,
        END OF ty_mara.

DATA : it_mara TYPE TABLE OF ty_mara,
       wa_mara TYPE ty_mara.

DATA : it_bdcdata TYPE  bdcdata occurs 0  WITH HEADER LINE .

PARAMETERS : p_file TYPE rlgrap-filename.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.

  CALL FUNCTION 'F4_FILENAME'
    EXPORTING
      program_name  = syst-cprog
      dynpro_number = syst-dynnr
*     FIELD_NAME    = 'P_FILE'
    IMPORTING
      file_name     = p_file.

START-OF-SELECTION.
  DATA : p_file_str TYPE string.

  p_file_str = p_file.

  CALL FUNCTION 'GUI_UPLOAD'
    EXPORTING
      filename            = p_file_str
      filetype            = 'ASC'
      has_field_separator = 'X'
*     HEADER_LENGTH       = 0
*     READ_BY_LINE        = 'X'
*     DAT_MODE            = ' '
*     CODEPAGE            = ' '
*     IGNORE_CERR         = ABAP_TRUE
*     REPLACEMENT         = '#'
*     CHECK_BOM           = ' '
*     VIRUS_SCAN_PROFILE  =
*     NO_AUTH_CHECK       = ' '
*   IMPORTING
*     FILELENGTH          =
*     HEADER              =
    TABLES
      data_tab            = it_mara
*   CHANGING
*     ISSCANPERFORMED     = ' '
*   EXCEPTIONS
*     FILE_OPEN_ERROR     = 1
*     FILE_READ_ERROR     = 2
*     NO_BATCH            = 3
*     GUI_REFUSE_FILETRANSFER       = 4
*     INVALID_TYPE        = 5
*     NO_AUTHORITY        = 6
*     UNKNOWN_ERROR       = 7
*     BAD_DATA_FORMAT     = 8
*     HEADER_NOT_ALLOWED  = 9
*     SEPARATOR_NOT_ALLOWED         = 10
*     HEADER_TOO_LONG     = 11
*     UNKNOWN_DP_ERROR    = 12
*     ACCESS_DENIED       = 13
*     DP_OUT_OF_MEMORY    = 14
*     DISK_FULL           = 15
*     DP_TIMEOUT          = 16
*     OTHERS              = 17
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

  "Remove the open group, insert and close group FMs from the  session  method
  LOOP AT it_mara INTO wa_mara.

    PERFORM bdc_dynpro      USING 'SAPLMGMM' '0060'.
    PERFORM bdc_field       USING 'BDC_CURSOR'
                                  'RMMG1-MTART'.
    PERFORM bdc_field       USING 'BDC_OKCODE'
                                  '=ENTR'.
    PERFORM bdc_field       USING 'RMMG1-MATNR'
*                              zrtc_m5'.
    wa_mara-matnr.
    PERFORM bdc_field       USING 'RMMG1-MBRSH'
*                              '1'.
    wa_mara-mbrsh.
    PERFORM bdc_field       USING 'RMMG1-MTART'
*                              'FERT'.
    wa_mara-mtart.
    PERFORM bdc_dynpro      USING 'SAPLMGMM' '0070'.
    PERFORM bdc_field       USING 'BDC_CURSOR'
                                  'MSICHTAUSW-DYTXT(01)'.
    PERFORM bdc_field       USING 'BDC_OKCODE'
                                  '=ENTR'.
    PERFORM bdc_field       USING 'MSICHTAUSW-KZSEL(01)'
                                  'X'.
    PERFORM bdc_dynpro      USING 'SAPLMGMM' '4004'.
    PERFORM bdc_field       USING 'BDC_OKCODE'
                                  '=BU'.
    PERFORM bdc_field       USING 'MAKT-MAKTX'
*                              'decrip'.
    wa_mara-maktx.
    PERFORM bdc_field       USING 'BDC_CURSOR'
                                  'MARA-KOSCH'.
    PERFORM bdc_field       USING 'MARA-MEINS'
*                              'kg'.
    wa_mara-meins.
    PERFORM bdc_field       USING 'MARA-MATKL'
*                              '01'.
    wa_mara-matkl.
    PERFORM bdc_field       USING 'MARA-KOSCH'
*                              'PA'.
    wa_mara-kosch.
  "The call transaction tcode is directly called without using the FM insert_bdc
  CALL  TRANSACTION 'MM01' USING it_bdcdata MODE 'A' UPDATE 'S'.
    REFRESH it_bdcdata.
  ENDLOOP.




*&---------------------------------------------------------------------*
*&      Form  BDC_DYNPRO
*&---------------------------------------------------------------------*

FORM bdc_dynpro  USING   p_program p_screen.
  CLEAR it_bdcdata.
  it_bdcdata-program = p_program.

  it_bdcdata-dynpro = p_screen.

  it_bdcdata-dynbegin = 'X'."continue button
  APPEND  it_bdcdata.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  BDC_FIELD
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_0093   text
*      -->P_0094   text
*----------------------------------------------------------------------*
FORM bdc_field  USING   p_fname
                         p_fvalue.
  CLEAR it_bdcdata.
  it_bdcdata-fnam = p_fname.
  it_bdcdata-fval = p_fvalue.
  APPEND it_bdcdata.
ENDFORM.