*&---------------------------------------------------------------------*
*& Report ZTRCAP_BDC_PROG1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTRCAP_BDC_PROG1.

INCLUDE ZTRCAP_BDC_PROG1_TOP.

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

  WRITE : / WA_TAB-MATNR,
            WA_TAB-MBRSH,
            WA_TAB-MTART,
            WA_TAB-MAKTX,
            WA_TAB-MEINS,
            WA_TAB-MATKL.

  ENDLOOP.