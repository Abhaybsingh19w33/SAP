*&---------------------------------------------------------------------*
*& REPORT ZTR_BDC_FILE_TO_ITAB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTR_BDC_SESSION_METH1_FILES.

TYPES : BEGIN OF TY_TAB,
       MATNR(18),
       MBRSH(1),
       MTART(4),
       MAKTX(40),
       MEINS(3),
       MATKL(9),
         END OF TY_TAB.
DATA :IT_TAB TYPE STANDARD TABLE OF TY_TAB,
      WA_TAB TYPE TY_TAB.

DATA IT_BDCDATA TYPE BDCDATA OCCURS 0 WITH HEADER LINE.

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
**
**CALL FUNCTION 'GUI_UPLOAD'
**  EXPORTING
**    FILENAME                      = P_FILE1
**   FILETYPE                      = 'ASC'
**   HAS_FIELD_SEPARATOR           = 'X'
***   HEADER_LENGTH                 = 0
***   READ_BY_LINE                  = 'X'
***   DAT_MODE                      = ' '
***   CODEPAGE                      = ' '
***   IGNORE_CERR                   = ABAP_TRUE
***   REPLACEMENT                   = '#'
***   CHECK_BOM                     = ' '
***   VIRUS_SCAN_PROFILE            =
***   NO_AUTH_CHECK                 = ' '
*** IMPORTING
***   FILELENGTH                    =
***   HEADER                        =
**  TABLES
**    DATA_TAB                      = IT_TAB
*** CHANGING
***   ISSCANPERFORMED               = ' '
*** EXCEPTIONS
***   FILE_OPEN_ERROR               = 1
***   FILE_READ_ERROR               = 2
***   NO_BATCH                      = 3
***   GUI_REFUSE_FILETRANSFER       = 4
***   INVALID_TYPE                  = 5
***   NO_AUTHORITY                  = 6
***   UNKNOWN_ERROR                 = 7
***   BAD_DATA_FORMAT               = 8
***   HEADER_NOT_ALLOWED            = 9
***   SEPARATOR_NOT_ALLOWED         = 10
***   HEADER_TOO_LONG               = 11
***   UNKNOWN_DP_ERROR              = 12
***   ACCESS_DENIED                 = 13
***   DP_OUT_OF_MEMORY              = 14
***   DISK_FULL                     = 15
***   DP_TIMEOUT                    = 16
***   OTHERS                        = 17
**          .
**IF SY-SUBRC <> 0.
*** IMPLEMENT SUITABLE ERROR HANDLING HERE
**ENDIF.


OPEN DATASET 'CAPGEM9' FOR INPUT IN TEXT MODE ENCODING DEFAULT.
DO.
READ DATASET 'CAPGEM9' INTO WA_TAB.
IF SY-SUBRC EQ 0.
    APPEND WA_TAB TO IT_TAB.
  CLEAR WA_TAB.
  ELSE.
    EXIT.
  ENDIF.
ENDDO.

CLOSE DATASET 'CAPGEM9'.



CALL FUNCTION 'BDC_OPEN_GROUP'
 EXPORTING
   CLIENT                    = SY-MANDT
*   DEST                      = FILLER8
   GROUP                     = 'CAP_BDC9'  " SM35 T-CODE
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
* IMPLEMENT SUITABLE ERROR HANDLING HERE
ENDIF.

LOOP AT IT_TAB INTO WA_TAB.

PERFORM BDC_DYNPRO      USING 'SAPLMGMM' '0060'.
PERFORM BDC_FIELD       USING 'BDC_CURSOR'
                              'RMMG1-MTART'.
PERFORM BDC_FIELD       USING 'BDC_OKCODE'
                              '=ENTR'.
PERFORM BDC_FIELD       USING 'RMMG1-MATNR'
                              WA_TAB-MATNR.
PERFORM BDC_FIELD       USING 'RMMG1-MBRSH'
                              WA_TAB-MBRSH.
PERFORM BDC_FIELD       USING 'RMMG1-MTART'
                              WA_TAB-MTART.
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
PERFORM BDC_FIELD       USING 'MAKT-MAKTX'
                              WA_TAB-MAKTX.
PERFORM BDC_FIELD       USING 'BDC_CURSOR'
                              'MARA-MATKL'.
PERFORM BDC_FIELD       USING 'MARA-MEINS'
                              WA_TAB-MEINS.
PERFORM BDC_FIELD       USING 'MARA-MATKL'
                              WA_TAB-MATKL.


  CALL FUNCTION 'BDC_INSERT'
   EXPORTING
     TCODE                  = 'MM01'
*     POST_LOCAL             = NOVBLOCAL
*     PRINTING               = NOPRINT
*     SIMUBATCH              = ' '
*     CTUPARAMS              = ' '
    TABLES
      DYNPROTAB              = IT_BDCDATA
*   EXCEPTIONS
*     INTERNAL_ERROR         = 1
*     NOT_OPEN               = 2
*     QUEUE_ERROR            = 3
*     TCODE_INVALID          = 4
*     PRINTING_INVALID       = 5
*     POSTING_INVALID        = 6
*     OTHERS                 = 7
            .
  IF SY-SUBRC <> 0.
* IMPLEMENT SUITABLE ERROR HANDLING HERE
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
* IMPLEMENT SUITABLE ERROR HANDLING HERE
  ENDIF.

  WRITE ' GO TO SM35 T-CODE AND PROCESS THE MAT'.

*&---------------------------------------------------------------------*
*&      FORM  BDC_DYNPRO
*&---------------------------------------------------------------------*
*       TEXT
*----------------------------------------------------------------------*
*      -->P_0123   TEXT
*      -->P_0124   TEXT
*----------------------------------------------------------------------*
FORM BDC_DYNPRO  USING PROGRAM DYNPRO .

CLEAR IT_BDCDATA.
IT_BDCDATA-PROGRAM = PROGRAM.
IT_BDCDATA-DYNPRO = DYNPRO.
IT_BDCDATA-DYNBEGIN = 'X'.
APPEND IT_BDCDATA.

ENDFORM.
*&---------------------------------------------------------------------*
*&      FORM  BDC_FIELD
*&---------------------------------------------------------------------*
*       TEXT
*----------------------------------------------------------------------*
*      -->P_0131   TEXT
*      -->P_0132   TEXT
*----------------------------------------------------------------------*
FORM BDC_FIELD  USING FNAM FVAL.

CLEAR IT_BDCDATA.
IT_BDCDATA-FNAM = FNAM.
IT_BDCDATA-FVAL = FVAL.

APPEND IT_BDCDATA.

ENDFORM.