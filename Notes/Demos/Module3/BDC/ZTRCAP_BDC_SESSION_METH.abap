-----------------------------------------*
REPORT ZTRCAP_BDC_SESSION_METH.

INCLUDE ZTRCAP_BDC_PROG1_TOP1.


PARAMETERS P_FILE TYPE RLGRAP-FILENAME.


 AT SELECTION-SCREEN ON VALUE-REQUEST FOR P_FILE.

   CALL FUNCTION 'F4_FILENAME'
    EXPORTING
      PROGRAM_NAME        = SYST-CPROG
      DYNPRO_NUMBER       = SYST-DYNNR
*      FIELD_NAME          = ' '
    IMPORTING
      FILE_NAME           = P_FILE
             .

 START-OF-SELECTION.

  DATA P_FILE1 TYPE STRING.
     P_FILE1 = P_FILE.

 CALL FUNCTION 'GUI_UPLOAD'
   EXPORTING
     FILENAME                      = P_FILE1
    FILETYPE                      = 'ASC'
    HAS_FIELD_SEPARATOR           = 'X'
*    HEADER_LENGTH                 = 0
*    READ_BY_LINE                  = 'X'
*    DAT_MODE                      = ' '
*    CODEPAGE                      = ' '
*    IGNORE_CERR                   = ABAP_TRUE
*    REPLACEMENT                   = '#'
*    CHECK_BOM                     = ' '
*    VIRUS_SCAN_PROFILE            =
*    NO_AUTH_CHECK                 = ' '
*  IMPORTING
*    FILELENGTH                    =
*    HEADER                        =
   TABLES
     DATA_TAB                      = IT_TAB
*  CHANGING
*    ISSCANPERFORMED               = ' '
*  EXCEPTIONS
*    FILE_OPEN_ERROR               = 1
*    FILE_READ_ERROR               = 2
*    NO_BATCH                      = 3
*    GUI_REFUSE_FILETRANSFER       = 4
*    INVALID_TYPE                  = 5
*    NO_AUTHORITY                  = 6
*    UNKNOWN_ERROR                 = 7
*    BAD_DATA_FORMAT               = 8
*    HEADER_NOT_ALLOWED            = 9
*    SEPARATOR_NOT_ALLOWED         = 10
*    HEADER_TOO_LONG               = 11
*    UNKNOWN_DP_ERROR              = 12
*    ACCESS_DENIED                 = 13
*    DP_OUT_OF_MEMORY              = 14
*    DISK_FULL                     = 15
*    DP_TIMEOUT                    = 16
*    OTHERS                        = 17
           .
 IF SY-SUBRC <> 0.
* Implement suitable error handling here
 ENDIF.


CALL FUNCTION 'BDC_OPEN_GROUP'
 EXPORTING
   CLIENT                    = SY-MANDT
*   DEST                      = FILLER8
   GROUP                     = 'TR_GRP'  " SM35 T-CODE
*   HOLDDATE                  = FILLER8
   KEEP                      = 'X'
   USER                      = SY-UNAME
*   RECORD                    = FILLER1
*   PROG                      = SY-CPROG
*   DCPFM                     = '%'
*   DATFM                     = '%'
* IMPORTING
*   QID                       =
* EXCEPTIONS
*   CLIENT_INVALID            = 1
*   DESTINATION_INVALID       = 2
*   GROUP_INVALID             = 3
*   GROUP_IS_LOCKED           = 4
*   HOLDDATE_INVALID          = 5
*   INTERNAL_ERROR            = 6
*   QUEUE_ERROR               = 7
*   RUNNING                   = 8
*   SYSTEM_LOCK_ERROR         = 9
*   USER_INVALID              = 10
*   OTHERS                    = 11
          .
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.




LOOP AT IT_TAB INTO WA_TAB.

perform bdc_dynpro      using 'SAPLMGMM' '0060'.
perform bdc_field       using 'BDC_CURSOR'
                              'RMMG1-MTART'.
perform bdc_field       using 'BDC_OKCODE'
                              '=ENTR'.
perform bdc_field       using 'RMMG1-MATNR'
                              WA_TAB-MATNR.
perform bdc_field       using 'RMMG1-MBRSH'
                              WA_TAB-MBRSH.
perform bdc_field       using 'RMMG1-MTART'
                              WA_TAB-MTART.
perform bdc_dynpro      using 'SAPLMGMM' '0070'.
perform bdc_field       using 'BDC_CURSOR'
                              'MSICHTAUSW-DYTXT(01)'.
perform bdc_field       using 'BDC_OKCODE'
                              '=ENTR'.
perform bdc_field       using 'MSICHTAUSW-KZSEL(01)'
                              'X'.
perform bdc_dynpro      using 'SAPLMGMM' '4004'.
perform bdc_field       using 'BDC_OKCODE'
                              '=BU'.
perform bdc_field       using 'MAKT-MAKTX'
                              WA_TAB-MAKTX.
perform bdc_field       using 'BDC_CURSOR'
                              'MARA-MATKL'.
perform bdc_field       using 'MARA-MEINS'
                              WA_TAB-MEINS.
perform bdc_field       using 'MARA-MATKL'
                              WA_TAB-MATKL.

CALL FUNCTION 'BDC_INSERT'
 EXPORTING
   TCODE                  = 'MM01'
*   POST_LOCAL             = NOVBLOCAL
*   PRINTING               = NOPRINT
*   SIMUBATCH              = ' '
*   CTUPARAMS              = ' '
  TABLES
    DYNPROTAB              = IT_BDCDATA
* EXCEPTIONS
*   INTERNAL_ERROR         = 1
*   NOT_OPEN               = 2
*   QUEUE_ERROR            = 3
*   TCODE_INVALID          = 4
*   PRINTING_INVALID       = 5
*   POSTING_INVALID        = 6
*   OTHERS                 = 7
          .
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.

REFRESH IT_BDCDATA.
  ENDLOOP.


  CALL FUNCTION 'BDC_CLOSE_GROUP'
*   EXCEPTIONS
*     NOT_OPEN          = 1
*     QUEUE_ERROR       = 2
*     OTHERS            = 3
            .
  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.
*&---------------------------------------------------------------------*
*&      Form  BDC_DYNPRO
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_0088   text
*      -->P_0089   text
*----------------------------------------------------------------------*
FORM BDC_DYNPRO  USING A B.

CLEAR IT_BDCDATA.
IT_BDCDATA-PROGRAM = A.
IT_BDCDATA-DYNPRO = B.
IT_BDCDATA-DYNBEGIN = 'X'.
APPEND IT_BDCDATA.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  BDC_FIELD
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_0093   text
*      -->P_0094   text
*----------------------------------------------------------------------*
FORM BDC_FIELD  USING  X Y.

CLEAR IT_BDCDATA.
IT_BDCDATA-FNAM = X.
IT_BDCDATA-FVAL = Y.

APPEND IT_BDCDATA.
ENDFORM.