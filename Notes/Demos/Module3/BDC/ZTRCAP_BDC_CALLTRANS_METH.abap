*&---------------------------------------------------------------------*
*& Report ZTRCAP_BDC_PROG1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTRCAP_BDC_CALLTRANS_METH.

INCLUDE ZTRCAP_BDC_PROG1_TOP2.

DATA : INDEX(5),
       TEXT(100).


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





LOOP AT IT_TAB INTO WA_TAB.

INDEX = SY-TABIX.

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


CALL TRANSACTION  'MM01' USING IT_BDCDATA MODE 'A' UPDATE 'S'.

IF SY-SUBRC NE  0.

  CALL FUNCTION 'FORMAT_MESSAGE'
   EXPORTING
*     ID              = SY-MSGID
     LANG            = 'EN'
*     NO              = SY-MSGNO
*     V1              = SY-MSGV1
*     V2              = SY-MSGV2
*     V3              = SY-MSGV3
*     V4              = SY-MSGV4
   IMPORTING
     MSG             =  TEXT
*   EXCEPTIONS
*     NOT_FOUND       = 1
*     OTHERS          = 2
            .
  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.

  CONCATENATE INDEX TEXT INTO TEXT SEPARATED BY '*'.

  WRITE TEXT.

  ENDIF.



REFRESH IT_BDCDATA.
  ENDLOOP.


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