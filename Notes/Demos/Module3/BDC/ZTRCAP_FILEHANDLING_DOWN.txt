*&---------------------------------------------------------------------*
*& Report ZTR_BDC_FILE_TO_ITAB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTRCAP_FILEHANDLING_DOWN.


DATA : BEGIN OF IT_TAB OCCURS 0,
       MATNR(18),
       MBRSH(1),
       MTART(4),
       MAKTX(40),
       MEINS(3),
       MATKL(9),

       END OF IT_TAB.

* PARAMETERS P_FILE TYPE RLGRAP-FILENAME.
*
*AT SELECTION-SCREEN ON VALUE-REQUEST FOR P_FILE.
**
*  CALL FUNCTION 'F4_FILENAME'
*   EXPORTING
*     PROGRAM_NAME        = SYST-CPROG
*     DYNPRO_NUMBER       = SYST-DYNNR
***     FIELD_NAME          = ' '
*   IMPORTING
*    FILE_NAME           = P_FILE
*            .

START-OF-SELECTION.
*
*DATA P_FILE1 TYPE STRING.
*
*P_FILE1 = P_FILE.




OPEN DATASET 'CAPGEM3' FOR INPUT IN TEXT MODE ENCODING DEFAULT.

DO.
READ DATASET 'CAPGEM3' INTO IT_TAB.
IF SY-SUBRC EQ 0.
    APPEND IT_TAB.
  CLEAR IT_TAB.
  ELSE.
    EXIT.
  ENDIF.
ENDDO.

CLOSE DATASET 'CAPGEM3'.


CALL FUNCTION 'GUI_DOWNLOAD'
  EXPORTING
*   BIN_FILESIZE                    =
    FILENAME                        = 'C:\Users\adm-ig-hwdlab2e\Desktop\MATMAST.TXT'
   FILETYPE                        = 'ASC'
*   APPEND                          = ' '
   WRITE_FIELD_SEPARATOR           = 'X'
*   HEADER                          = '00'
*   TRUNC_TRAILING_BLANKS           = ' '
*   WRITE_LF                        = 'X'
*   COL_SELECT                      = ' '
*   COL_SELECT_MASK                 = ' '
*   DAT_MODE                        = ' '
*   CONFIRM_OVERWRITE               = ' '
*   NO_AUTH_CHECK                   = ' '
*   CODEPAGE                        = ' '
*   IGNORE_CERR                     = ABAP_TRUE
*   REPLACEMENT                     = '#'
*   WRITE_BOM                       = ' '
*   TRUNC_TRAILING_BLANKS_EOL       = 'X'
*   WK1_N_FORMAT                    = ' '
*   WK1_N_SIZE                      = ' '
*   WK1_T_FORMAT                    = ' '
*   WK1_T_SIZE                      = ' '
*   WRITE_LF_AFTER_LAST_LINE        = ABAP_TRUE
*   SHOW_TRANSFER_STATUS            = ABAP_TRUE
*   VIRUS_SCAN_PROFILE              = '/SCET/GUI_DOWNLOAD'
* IMPORTING
*   FILELENGTH                      =
  TABLES
    DATA_TAB                        = IT_TAB
*   FIELDNAMES                      =
* EXCEPTIONS
*   FILE_WRITE_ERROR                = 1
*   NO_BATCH                        = 2
*   GUI_REFUSE_FILETRANSFER         = 3
*   INVALID_TYPE                    = 4
*   NO_AUTHORITY                    = 5
*   UNKNOWN_ERROR                   = 6
*   HEADER_NOT_ALLOWED              = 7
*   SEPARATOR_NOT_ALLOWED           = 8
*   FILESIZE_NOT_ALLOWED            = 9
*   HEADER_TOO_LONG                 = 10
*   DP_ERROR_CREATE                 = 11
*   DP_ERROR_SEND                   = 12
*   DP_ERROR_WRITE                  = 13
*   UNKNOWN_DP_ERROR                = 14
*   ACCESS_DENIED                   = 15
*   DP_OUT_OF_MEMORY                = 16
*   DISK_FULL                       = 17
*   DP_TIMEOUT                      = 18
*   FILE_NOT_FOUND                  = 19
*   DATAPROVIDER_EXCEPTION          = 20
*   CONTROL_FLUSH_ERROR             = 21
*   OTHERS                          = 22
          .
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.