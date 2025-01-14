https://answers.sap.com/questions/1479822/structure-of-bdcmsgcoll.html
*&---------------------------------------------------------------------*
*& Report ZRTC_BDC
*&---------------------------------------------------------------------*
*&file : change the type od material type

q118	1	FERT	SHORTDESC	KG	02	PA
q3115	1	ABcD	SHORTDESC	KG	02	PA
q3117	1	FERT	SHORTDESC	KG	02	PA
*&---------------------------------------------------------------------*
REPORT zrtc_bdc_calltrans_err.

TYPES : BEGIN OF ty_mara,
          matnr TYPE matnr,  " Material Number
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

 data : it_bdcmsgcoll type bdcmsgcoll occurs 0 WITH HEADER LINE,
        lv_msg(100),
        lv_tabix type string.


PARAMETERS : p_file TYPE rlgrap-filename.

INITIALIZATION.
P_FILE = 'C:\Users\abhbhagw\OneDrive - Capgemini\Desktop\New Text Document.txt'.

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
  CALL FUNCTION 'BDC_OPEN_GROUP'
    EXPORTING
      client = sy-mandt
      group  = 'ZYNY_001'  " to be executed in sm35
      keep   = 'X'
      user   = sy-uname.

  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
  LOOP AT it_mara INTO wa_mara.
    " to collect the error  reocrds no.
    lv_tabix = sy-tabix.

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
    " CALL  TRANSACTION 'MM01' USING it_bdcdata MODE 'N' UPDATE 'S'.
    CALL  TRANSACTION 'MM01' USING it_bdcdata MODE 'A' UPDATE 'S' MESSAGES INTO IT_BDCMSGCOLL.

    CALL FUNCTION 'FORMAT_MESSAGE'
      EXPORTING
*       id   = sy-msgid
        lang = 'EN'
*       NO   = SY-MSGNO
*       V1   = SY-MSGV1
*       V2   = SY-MSGV2
*       V3   = SY-MSGV3
*       V4   = SY-MSGV4
      IMPORTING
        msg  = lv_msg
*       msg  = it_bdcmsgcoll
* EXCEPTIONS
*       NOT_FOUND       = 1
*       OTHERS          = 2
      .
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.

    "Way1 to display erro message
    CONCATENATE lv_tabix lv_msg INTO lv_msg SEPARATED BY '*'.
    WRITE : lv_msg.

    "Way2 to display error message
*    WRITE : / it_bdcmsgcoll.
*    WRITE : / 'it_bdcmsgcoll', it_bdcmsgcoll. " Collecting messages in the SAP System
*    WRITE : / 'it_bdcmsgcoll-TCODE', it_bdcmsgcoll-TCODE. " Collecting messages in the SAP System

    REFRESH it_bdcdata.
  ENDLOOP.

  CL_DEMO_OUTPUT=>DISPLAY( IT_BDCMSGCOLL ).

  CALL FUNCTION 'BDC_CLOSE_GROUP'.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

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