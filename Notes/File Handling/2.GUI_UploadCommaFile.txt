REPORT ZAT_FILE2.

"notepad file with comma separated data
This is from Desktop to program.
==================================
Create a notepad with below data and save it on ur desktop.
Give the name of the notepad as customercomma.txt


zxyz13,IN,name1,Mumbai,123456	
zxyz14,IN,name2,Pune,123456
zxyz15,IN,name3,Mumbai,123456
zxyz17,IN,name4,Pune,123456
=================================


TYPES: BEGIN OF TY_KNA1,
         KUNNR TYPE  KUNNR,
         LAND1 TYPE  LAND1_GP,
         NAME1 TYPE  NAME1_GP,
         ORT01 TYPE  ORT01_GP,
         PSTLZ TYPE  PSTLZ,
       END OF TY_KNA1.

TYPES: BEGIN OF TY_FINAL,
         TEXT(150) TYPE C,
       END OF TY_FINAL.

DATA : IT_KNA1  TYPE TABLE OF TY_KNA1,
       IT_FINAL TYPE TABLE OF TY_FINAL,
       WA_KNA1  TYPE  TY_KNA1,
       WA_FINAL TYPE  TY_FINAL.




DATA V_MSG TYPE STRING.


CALL FUNCTION 'GUI_UPLOAD'
  EXPORTING
    FILENAME = 'C:\Users\athomson\Documents\SAP\SAP GUI\Module 2\File handling\customercomma.txt'
  FILETYPE = 'ASC'
*  HAS_FIELD_SEPARATOR           = 'x'
*   HEADER_LENGTH                 = 0
*   READ_BY_LINE                  = 'X'
*   DAT_MODE = ' '
*   CODEPAGE = ' '
*   IGNORE_CERR                   = ABAP_TRUE
*   REPLACEMENT                   = '#'
*   CHECK_BOM                     = ' '
*   VIRUS_SCAN_PROFILE            =
*   NO_AUTH_CHECK                 = ' '
* IMPORTING
*   FILELENGTH                    =
*   HEADER   =
  TABLES
    DATA_TAB = IT_FINAL
* CHANGING
*   ISSCANPERFORMED               = ' '
* EXCEPTIONS
*   FILE_OPEN_ERROR               = 1
*   FILE_READ_ERROR               = 2
*   NO_BATCH = 3
*   GUI_REFUSE_FILETRANSFER       = 4
*   INVALID_TYPE                  = 5
*   NO_AUTHORITY                  = 6
*   UNKNOWN_ERROR                 = 7
*   BAD_DATA_FORMAT               = 8
*   HEADER_NOT_ALLOWED            = 9
*   SEPARATOR_NOT_ALLOWED         = 10
*   HEADER_TOO_LONG               = 11
*   UNKNOWN_DP_ERROR              = 12
*   ACCESS_DENIED                 = 13
*   DP_OUT_OF_MEMORY              = 14
*   DISK_FULL                     = 15
*   DP_TIMEOUT                    = 16
*   OTHERS   = 17
  .



LOOP AT IT_FINAL INTO WA_FINAL.
  SPLIT  WA_FINAL-TEXT AT ','
  INTO WA_KNA1-KUNNR  WA_KNA1-LAND1  WA_KNA1-NAME1  WA_KNA1-ORT01  WA_KNA1-PSTLZ.
*into table it_kna1.
*   WRITE:/ WA_KNA1-KUNNR,
*         WA_KNA1-LAND1,
*         WA_KNA1-NAME1,
*         WA_KNA1-ORT01,
*         WA_KNA1-PSTLZ.
  APPEND WA_KNA1 TO IT_KNA1.
ENDLOOP.

LOOP AT IT_KNA1 INTO WA_KNA1.
  WRITE:/ WA_KNA1-KUNNR,
         WA_KNA1-LAND1,
         WA_KNA1-NAME1,
         WA_KNA1-ORT01,
         WA_KNA1-PSTLZ.

ENDLOOP.
**  MESSAGE 'No Data' TYPE 'I'.
*endif.