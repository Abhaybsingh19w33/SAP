*&---------------------------------------------------------------------*
*& Report ZRTC_BDC
*&---------------------------------------------------------------------*
*&file 
V2115	1	FERT	SHORTDESC	KG	02	PA
V2119	1	FERT	SHORTDESC	KG	02	PA
V2117	1	FERT	SHORTDESC	KG	02	PA
V2118	1	FERT	SHORTDESC	KG	02	PA
*&---------------------------------------------------------------------*
or
zpq3	1	HALB	SHORTDESC	FT	01
zpq4	1	HALB	SHORTDESC	FT	01
zpq5	1	HALB	SHORTDESC	FT	01
zpq6	1	HALB	SHORTDESC	FT	01
--------------------------------------------------------------

*&---------------------------------------------------------------------*
*& Report ZYNY_TEST8
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZYNY_TEST8.

TYPES : BEGIN OF TY_MARA,
          MATNR TYPE MATNR,
          MBRSH TYPE MBRSH,  " Industry sector
          MTART TYPE MTART,  " Material type
          MAKTX TYPE MAKTX,  " MAT DESCR
          MEINS TYPE MEINS,  " Base Unit of Measure
          MATKL TYPE MATKL,  " MAT GRP
          KOSCH TYPE KOSCH,
        END OF TY_MARA.

DATA : IT_MARA    TYPE TABLE OF TY_MARA,
       WA_MARA    TYPE TY_MARA,
       P_FILE_STR TYPE STRING,
       IT_BDCDATA TYPE BDCDATA OCCURS 0 WITH HEADER LINE.

PARAMETERS : P_FILE TYPE RLGRAP-FILENAME.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR P_FILE.

  CALL FUNCTION 'F4_FILENAME'
    EXPORTING
      PROGRAM_NAME  = SYST-CPROG
      DYNPRO_NUMBER = SYST-DYNNR
*     FIELD_NAME    = 'P_FILE'
    IMPORTING
      FILE_NAME     = P_FILE.

START-OF-SELECTION.

  P_FILE_STR = P_FILE.

  CALL FUNCTION 'GUI_UPLOAD'
    EXPORTING
      FILENAME            = P_FILE_STR
      FILETYPE            = 'ASC'
      HAS_FIELD_SEPARATOR = 'X'
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
      DATA_TAB            = IT_MARA
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
  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.


  CALL FUNCTION 'BDC_OPEN_GROUP'
    EXPORTING
      CLIENT = SY-MANDT
      GROUP  = 'ZRTC_GRP'  " to be executed in sm35
      KEEP   = 'X'
      USER   = SY-UNAME.
  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.

  LOOP AT IT_MARA INTO WA_MARA.


    PERFORM BDC_DYNPRO      USING 'SAPLMGMM' '0060'.
    PERFORM BDC_FIELD       USING 'BDC_CURSOR'
                                  'RMMG1-MTART'.
    PERFORM BDC_FIELD       USING 'BDC_OKCODE'
                                  '=ENTR'.
    PERFORM BDC_FIELD       USING 'RMMG1-MATNR' WA_MARA-MATNR.
*                              zrtc_m5'.
    PERFORM BDC_FIELD       USING 'RMMG1-MBRSH' WA_MARA-MBRSH.
*                              '1'.

    PERFORM BDC_FIELD       USING 'RMMG1-MTART' WA_MARA-MTART.
*                              'FERT'.

    PERFORM BDC_DYNPRO      USING 'SAPLMGMM' '0070'.
    PERFORM BDC_FIELD       USING 'BDC_CURSOR'
                                  'MSICHTAUSW-DYTXT(01)'.
    PERFORM BDC_FIELD       USING 'BDC_OKCODE'
                                  '=ENTR'.
    PERFORM BDC_FIELD       USING 'MSICHTAUSW-KZSEL(01)'
                                  'X'.
    PERFORM BDC_DYNPRO      USING 'SAPLMGMM' '4004'.
    PERFORM BDC_FIELD       USING 'BDC_OKCODE'
                                  '=BU'.
    PERFORM BDC_FIELD       USING 'MAKT-MAKTX' WA_MARA-MAKTX.
*                              'decrip'.

    PERFORM BDC_FIELD       USING 'BDC_CURSOR'
                                  'MARA-KOSCH'.
    PERFORM BDC_FIELD       USING 'MARA-MEINS' WA_MARA-MEINS.
*                              'kg'.

    PERFORM BDC_FIELD       USING 'MARA-MATKL' WA_MARA-MATKL.
*                              '01'.

    PERFORM BDC_FIELD       USING 'MARA-KOSCH' WA_MARA-KOSCH.
*                              'PA'.

    CALL FUNCTION 'BDC_INSERT'
      EXPORTING
        TCODE     = 'MM01'
      TABLES
        DYNPROTAB = IT_BDCDATA.

    IF SY-SUBRC <> 0.
* Implement suitable error handling here
    ENDIF.

    REFRESH IT_BDCDATA.

  ENDLOOP.

  CALL FUNCTION 'BDC_CLOSE_GROUP'.
  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.


  WRITE: 'GO TO SM35 T-CODE AND RUN THE SESSION FOR BDC.'.
*&---------------------------------------------------------------------*
*&      Form  BDC_DYNPRO
*&---------------------------------------------------------------------*

FORM BDC_DYNPRO  USING   P_PROGRAM P_SCREEN.
  CLEAR IT_BDCDATA.
  IT_BDCDATA-PROGRAM = P_PROGRAM.

  IT_BDCDATA-DYNPRO = P_SCREEN.

  IT_BDCDATA-DYNBEGIN = 'X'."continue button
  APPEND  IT_BDCDATA.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  BDC_FIELD
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_0093   text
*      -->P_0094   text
*----------------------------------------------------------------------*
FORM BDC_FIELD  USING   P_FNAME
                         P_FVALUE.
  CLEAR IT_BDCDATA.
  IT_BDCDATA-FNAM = P_FNAME.
  IT_BDCDATA-FVAL = P_FVALUE.
  APPEND IT_BDCDATA.
ENDFORM.