*&---------------------------------------------------------------------*
*& REPORT ZTR_BDC_FILE_TO_ITAB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTR_BDC_CALLTRANS_PRG.

TYPES : BEGIN OF TY_TAB,
       MATNR(18),
       MBRSH(1),
       MTART(4),
       MAKTX(40),
       MEINS(3),
       MATKL(9),
         END OF TY_TAB.
DATA :INDEX(5),
      TEXT(50).

DATA :IT_TAB TYPE STANDARD TABLE OF TY_TAB,
      WA_TAB TYPE TY_TAB.

DATA IT_BDCDATA TYPE BDCDATA OCCURS 0 WITH HEADER LINE.

 PARAMETERS P_FILE TYPE RLGRAP-FILENAME.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR P_FILE.
*
  CALL FUNCTION 'F4_FILENAME'
   EXPORTING
     PROGRAM_NAME        = SYST-CPROG
     DYNPRO_NUMBER       = SYST-DYNNR
**     FIELD_NAME          = ' '
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
*   HEADER_LENGTH                 = 0
*   READ_BY_LINE                  = 'X'
*   DAT_MODE                      = ' '
*   CODEPAGE                      = ' '
*   IGNORE_CERR                   = ABAP_TRUE
*   REPLACEMENT                   = '#'
*   CHECK_BOM                     = ' '
*   VIRUS_SCAN_PROFILE            =
*   NO_AUTH_CHECK                 = ' '
* IMPORTING
*   FILELENGTH                    =
*   HEADER                        =
  TABLES
    DATA_TAB                      = IT_TAB
* CHANGING
*   ISSCANPERFORMED               = ' '
* EXCEPTIONS
*   FILE_OPEN_ERROR               = 1
*   FILE_READ_ERROR               = 2
*   NO_BATCH                      = 3
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
*   OTHERS                        = 17
          .
IF SY-SUBRC <> 0.
* IMPLEMENT SUITABLE ERROR HANDLING HERE
ENDIF.



LOOP AT IT_TAB INTO WA_TAB.

INDEX = SY-TABIX. " 4
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

CALL TRANSACTION 'MM01' USING IT_BDCDATA MODE 'N' UPDATE 'S'.

IF SY-SUBRC NE 0.

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
     MSG             = TEXT
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