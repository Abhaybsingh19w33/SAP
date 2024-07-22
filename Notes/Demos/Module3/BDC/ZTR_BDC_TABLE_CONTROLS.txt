
*&---------------------------------------------------------------------*
*& Report ZTR_BDC_TABLE_CONTROLS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTR_BDC_TABLE_CONTROLS.


INCLUDE ZTR_BDC_TABLE_CONTROLS_INCL.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR P_FILE1.

  CALL FUNCTION 'F4_FILENAME'
    EXPORTING
      PROGRAM_NAME  = SYST-CPROG
      DYNPRO_NUMBER = SYST-DYNNR
*     FIELD_NAME    = ' '
    IMPORTING
      FILE_NAME     = P_FILE1.


AT SELECTION-SCREEN ON VALUE-REQUEST FOR P_FILE2.
  CALL FUNCTION 'F4_FILENAME'
    EXPORTING
      PROGRAM_NAME  = SYST-CPROG
      DYNPRO_NUMBER = SYST-DYNNR
*     FIELD_NAME    = ' '
    IMPORTING
      FILE_NAME     = P_FILE2.

START-OF-SELECTION.
  DATA : P_FILE3 TYPE STRING.     "FOR GUI_UPLOAD
         P_FILE3 = P_FILE1.

  DATA : P_FILE4 TYPE STRING.     "FOR GUI_UPLOAD
         P_FILE4 = P_FILE2.

****UPLOAD FOR VENDOR HEADER DETAILS
  CALL FUNCTION 'GUI_UPLOAD'
    EXPORTING
      FILENAME            = P_FILE3
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
* IMPORTING
*     FILELENGTH          =
*     HEADER              =
    TABLES
      DATA_TAB            = IT_TAB1
* CHANGING
*     ISSCANPERFORMED     = ' '
* EXCEPTIONS
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

****UPLOAD FOR VENDOR LINE ITEM DETAILS

  CALL FUNCTION 'GUI_UPLOAD'
    EXPORTING
      FILENAME            = P_FILE4
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
* IMPORTING
*     FILELENGTH          =
*     HEADER              =
    TABLES
      DATA_TAB            = IT_TAB2
* CHANGING
*     ISSCANPERFORMED     = ' '
* EXCEPTIONS
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
*     DEST   = FILLER8
      GROUP  = 'TR_GRP'
*     HOLDDATE                  = FILLER8
      KEEP   = 'X'
      USER   = SY-UNAME
*     RECORD = FILLER1
*     PROG   = SY-CPROG
*     DCPFM  = '%'
*     DATFM  = '%'
* IMPORTING
*     QID    =
* EXCEPTIONS
*     CLIENT_INVALID            = 1
*     DESTINATION_INVALID       = 2
*     GROUP_INVALID             = 3
*     GROUP_IS_LOCKED           = 4
*     HOLDDATE_INVALID          = 5
*     INTERNAL_ERROR            = 6
*     QUEUE_ERROR               = 7
*     RUNNING                   = 8
*     SYSTEM_LOCK_ERROR         = 9
*     USER_INVALID              = 10
*     OTHERS = 11
    .
  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.


  LOOP AT IT_TAB1 INTO WA_TAB1.


    perform bdc_dynpro      using 'SAPMF02K' '0107'.
    perform bdc_field       using 'BDC_CURSOR'
                                  'RF02K-LIFNR'.
    perform bdc_field       using 'BDC_OKCODE'
                                  '/00'.
    perform bdc_field       using 'RF02K-LIFNR'
                                  WA_TAB1-LIFNR.
    perform bdc_field       using 'RF02K-EKORG'
                                  WA_TAB1-EKORG.
    perform bdc_field       using 'RF02K-KTOKK'
                                  WA_TAB1-KTOKK.
    perform bdc_dynpro      using 'SAPMF02K' '0110'.
    perform bdc_field       using 'BDC_CURSOR'
                                  'LFA1-SPRAS'.
    perform bdc_field       using 'BDC_OKCODE'
                                  '/00'.
    perform bdc_field       using 'LFA1-ANRED'
                                  WA_TAB1-ANRED.
    perform bdc_field       using 'LFA1-NAME1'
                                  WA_TAB1-NAME1.
    perform bdc_field       using 'LFA1-SORTL'
                                  WA_TAB1-SORTL.
    perform bdc_field       using 'LFA1-LAND1'
                                  WA_TAB1-LAND1.
    perform bdc_field       using 'LFA1-SPRAS'
                                  WA_TAB1-SPRAS.
    perform bdc_dynpro      using 'SAPMF02K' '0120'.
    perform bdc_field       using 'BDC_CURSOR'
                                  'LFA1-KUNNR'.
    perform bdc_field       using 'BDC_OKCODE'
                                  '/00'.

    LOOP AT IT_TAB2 INTO WA_TAB2.


      IF WA_TAB2-LIFNR = WA_TAB1-LIFNR.
        NUM = NUM + 1.

        CONCATENATE : 'LFBK-BANKS (' N ') ' INTO P,
                      'LFBK-BANKL (' N ') ' INTO Q,
                      'LFBK-BANKN (' N ') ' INTO R,
                      'LFBK-KOINH (' N ') ' INTO T,
                      'LFBK-BKONT (' N ') ' INTO U.
*                      'BNKA-BANKA (' N ') ' INTO V.
    perform bdc_dynpro      using 'SAPMF02K' '0130'.
    perform bdc_field       using 'BDC_CURSOR'
                                  'LFBK-BKONT(02)'.
    perform bdc_field       using 'BDC_OKCODE'
                                  '=ENTR'.
    perform bdc_field       using P
                                      WA_TAB2-BANKS.
*perform bdc_field       using P
*                              WA_TAB2-BANKS.
        perform bdc_field       using Q
                                      WA_TAB2-BANKL.
*perform bdc_field       using Q
*                              WA_TAB2-BANKL.
        perform bdc_field       using R
                                      WA_TAB2-BANKN.
*perform bdc_field       using R
*                              WA_TAB2-BANKN.
        perform bdc_field       using T
                                      WA_TAB2-KOINH.
*perform bdc_field       using T
*                              WA_TAB2-KOINH.
        perform bdc_field       using U
                                      WA_TAB2-BKONT.

      ENDIF.
    ENDLOOP.

   NUM = 0.

    CALL FUNCTION 'BDC_INSERT'
      EXPORTING
        TCODE     = 'MK01'
*       POST_LOCAL             = NOVBLOCAL
*       PRINTING  = NOPRINT
*       SIMUBATCH = ' '
*       CTUPARAMS = ' '
      TABLES
        DYNPROTAB = IT_BDCDATA
* EXCEPTIONS
*       INTERNAL_ERROR         = 1
*       NOT_OPEN  = 2
*       QUEUE_ERROR            = 3
*       TCODE_INVALID          = 4
*       PRINTING_INVALID       = 5
*       POSTING_INVALID        = 6
*       OTHERS    = 7
      .
    IF SY-SUBRC <> 0.
* Implement suitable error handling here
    ENDIF.


    REFRESH IT_BDCDATA.
  ENDLOOP.

  CALL FUNCTION 'BDC_CLOSE_GROUP'
* EXCEPTIONS
*   NOT_OPEN          = 1
*   QUEUE_ERROR       = 2
*   OTHERS            = 3
    .
  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.


  WRITE 'Vendor master data need to process from SM35 T-Code' .


FORM BDC_DYNPRO  USING PROGRAM DYNPRO.

  CLEAR IT_BDCDATA .
  IT_BDCDATA-PROGRAM = PROGRAM.
  IT_BDCDATA-DYNPRO = DYNPRO.
  IT_BDCDATA-DYNBEGIN = 'X'.
  APPEND IT_BDCDATA.



ENDFORM.


FORM BDC_FIELD  USING      FNAM FVAL.
  CLEAR IT_BDCDATA.
  IT_BDCDATA-FNAM = FNAM.
  IT_BDCDATA-FVAL = FVAL.
  APPEND IT_BDCDATA.

ENDFORM.