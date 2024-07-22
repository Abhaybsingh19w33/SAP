*&---------------------------------------------------------------------*
*& Report ZTRCAP_BDC_PROG2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTRCAP_BDC_PROG2.

PARAMETERS P_FILE TYPE RLGRAP-FILENAME.
DATA : BEGIN OF IT_TAB1 OCCURS 0,

     TEXT(100),

   END OF IT_TAB1.



DATA : BEGIN OF IT_TAB OCCURS 0,
       MATNR(18),
       MBRSH(1),
       MTART(4),
       MAKTX(40),
       MEINS(4),
       MATKL(9),

           END OF IT_TAB.


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
     DATA_TAB                      = IT_TAB1
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

LOOP AT IT_TAB1.

 SPLIT IT_TAB1 AT ','

 INTO IT_TAB-MATNR IT_TAB-MBRSH IT_TAB-MTART IT_TAB-MAKTX
      IT_TAB-MEINS IT_TAB-MATKL.

  APPEND IT_TAB.
  CLEAR IT_TAB.
  CLEAR IT_TAB1.


  ENDLOOP.



LOOP AT IT_TAB.

  WRITE : / IT_TAB-MATNR,
            IT_TAB-MBRSH,
            IT_TAB-MTART,
            IT_TAB-MAKTX,
            IT_TAB-MEINS,
            IT_TAB-MATKL.

  ENDLOOP.