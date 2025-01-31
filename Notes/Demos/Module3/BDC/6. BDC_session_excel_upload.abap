REPORT ZYNY_BDC_TRANSACTION_EXCEL_UPL.

TYPES: BEGIN OF TY_TAB,  " LOCAL STRS
       MATNR TYPE MATNR, " Material Number
       MBRSH TYPE MBRSH, " Industry sector
       MTART TYPE MTART, " Material TYPE
       MAKTX TYPE MAKTX, " MATERIAL DESC
       MEINS TYPE MEINS, " Base Unit of Measure
       MATKL TYPE MATKL, " Material Group
      END OF TY_TAB.

DATA: IT_TAB TYPE STANDARD TABLE OF TY_TAB,
      WA_TAB TYPE TY_TAB.

DATA IT_BDCDATA TYPE BDCDATA OCCURS 0 WITH HEADER LINE.

DATA LV_DATE TYPE SY-DATUM.

DATA IT_RAW TYPE TRUXS_T_TEXT_DATA.

PARAMETERS P_FILE TYPE RLGRAP-FILENAME.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR P_FILE.
*
  CALL FUNCTION 'F4_FILENAME'
  EXPORTING
    PROGRAM_NAME        = SYST-CPROG
    DYNPRO_NUMBER       = SYST-DYNNR
*   FIELD_NAME          = ' '
  IMPORTING
    FILE_NAME           = P_FILE
            .

START-OF-SELECTION.

CALL FUNCTION 'TEXT_CONVERT_XLS_TO_SAP'
  EXPORTING
   I_FIELD_SEPERATOR          = 'X'
   I_LINE_HEADER              = 'X'
    i_tab_raw_data             = IT_RAW
    i_filename                 = P_FILE
  TABLES
    i_tab_converted_data       = IT_TAB
* EXCEPTIONS
*   CONVERSION_FAILED          = 1
*   OTHERS                     = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

LV_DATE = SY-DATUM - 1.

CALL FUNCTION 'BDC_OPEN_GROUP'
 EXPORTING
   CLIENT                    = SY-MANDT
   GROUP                     = 'ZTR_GRP'  " SM35 T-CODE
   HOLDDATE                  = LV_DATE
   KEEP                      = 'X'
   USER                      = SY-UNAME
          .
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.

CL_DEMO_OUTPUT=>DISPLAY( IT_TAB ).

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
  TABLES
    DYNPROTAB              = IT_BDCDATA
            .
  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.

  REFRESH IT_BDCDATA.
ENDLOOP.

CALL FUNCTION 'BDC_CLOSE_GROUP'.
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.

WRITE 'GO TO SM35-TCODE AND PROCESS THE SESSION FOR MM01'.
*&---------------------------------------------------------------------*
*&      Form  BDC_DYNPRO
*&---------------------------------------------------------------------*
FORM BDC_DYNPRO  USING P_PROGRAM P_DYNPRO.
  CLEAR IT_BDCDATA.

  IT_BDCDATA-PROGRAM =  P_PROGRAM.
  IT_BDCDATA-DYNPRO =  P_DYNPRO.
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
FORM BDC_FIELD  USING  P_FNAM P_FVAL.
  CLEAR IT_BDCDATA.

  IT_BDCDATA-FNAM =  P_FNAM.
  IT_BDCDATA-FVAL =  P_FVAL.

  APPEND IT_BDCDATA.
ENDFORM.