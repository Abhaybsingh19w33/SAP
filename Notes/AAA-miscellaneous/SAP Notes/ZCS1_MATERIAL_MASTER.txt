*&---------------------------------------------------------------------*
*& Report ZCS1_MATERIAL_MASTER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCS1_MATERIAL_MASTER.

*&---------------------Data Declaration--------------------------------*
DATA : GV_MATNR    TYPE MARA-MATNR,
       LT_FIELDCAT TYPE TABLE OF SLIS_FIELDCAT_ALV.
*&---------------------Selection Screen--------------------------------*
SELECT-OPTIONS : SO_MATNR FOR GV_MATNR.

AT SELECTION-SCREEN.
  IF SO_MATNR-LOW IS INITIAL AND SO_MATNR-HIGH IS INITIAL.
    MESSAGE E000(ZCS_MSG).
  ENDIF.

START-OF-SELECTION.
  "Fetch data for material from MARA, MARC, MAKT
  SELECT MARA~MATNR,
         MARA~MTART,
         MARA~MATKL,
         MARA~ERSDA,
         MARA~ERNAM,
         MARA~BRGEW,
         MARA~MEINS,
         MARA~NTGEW,
         MARA~MBRSH,
         MARC~WERKS,
         MARC~PSTAT,
         MARC~WEBAZ,
         MARC~BSTMA,
         MARC~BSTRF,
         MARC~FHORI,
         MARC~LOSFX,
         MARC~BSTMI,
         MAKT~MAKTX
          FROM MARA
          INNER JOIN MARC ON MARC~MATNR = MARA~MATNR
          INNER JOIN MAKT ON MAKT~MATNR = MARA~MATNR
          INTO TABLE @DATA(LT_MAT)
          WHERE MARA~MATNR IN @SO_MATNR.

  IF SY-SUBRC <> 0.
    LEAVE LIST-PROCESSING.
    MESSAGE E001(ZCS_MSG).
  ENDIF.

END-OF-SELECTION.

  " Field-catalog for ALV
  LT_FIELDCAT = VALUE #( ( COL_POS = 1 FIELDNAME = 'MATNR' TABNAME = 'LT_MAT' SELTEXT_M = 'Material Number' )
                         ( COL_POS = 2 FIELDNAME = 'MTART' TABNAME = 'LT_MAT' SELTEXT_M = 'Material Type' )
                         ( COL_POS = 3 FIELDNAME = 'MATKL' TABNAME = 'LT_MAT' SELTEXT_M = 'Material Group' )
                         ( COL_POS = 4 FIELDNAME = 'ERSDA' TABNAME = 'LT_MAT' SELTEXT_M = 'Created On' )
                         ( COL_POS = 5 FIELDNAME = 'ERNAM' TABNAME = 'LT_MAT' SELTEXT_M = 'Name of Person Responsible for Creating the Object' )
                         ( COL_POS = 6 FIELDNAME = 'BRGEW' TABNAME = 'LT_MAT' SELTEXT_M = 'Gross Weight' )
                         ( COL_POS = 7 FIELDNAME = 'MEINS' TABNAME = 'LT_MAT' SELTEXT_M = 'Base Unit of Measure' )
                         ( COL_POS = 8 FIELDNAME = 'NTGEW' TABNAME = 'LT_MAT' SELTEXT_M = 'Net Weight' )
                         ( COL_POS = 9 FIELDNAME = 'MBRSH' TABNAME = 'LT_MAT' SELTEXT_M = 'Industry Sector' )
                         ( COL_POS = 10 FIELDNAME = 'WERKS' TABNAME = 'LT_MAT' SELTEXT_M = 'Plant' )
                         ( COL_POS = 11 FIELDNAME = 'PSTAT' TABNAME = 'LT_MAT' SELTEXT_M = 'Maintenance status' )
                         ( COL_POS = 12 FIELDNAME = 'WEBAZ' TABNAME = 'LT_MAT' SELTEXT_M = 'Goods receipt processing time in days' )
                         ( COL_POS = 13 FIELDNAME = 'BSTMA' TABNAME = 'LT_MAT' SELTEXT_M = 'Maximum Lot Size' )
                         ( COL_POS = 14 FIELDNAME = 'BSTRF' TABNAME = 'LT_MAT' SELTEXT_M = 'Rounding value for purchase order quantity' )
                         ( COL_POS = 15 FIELDNAME = 'FHORI' TABNAME = 'LT_MAT' SELTEXT_M = 'Scheduling Margin Key for Floats' )
                         ( COL_POS = 16 FIELDNAME = 'LOSFX' TABNAME = 'LT_MAT' SELTEXT_M = 'Ordering costs' )
                         ( COL_POS = 17 FIELDNAME = 'BSTMI' TABNAME = 'LT_MAT' SELTEXT_M = 'Minimum Lot Size' )
                         ( COL_POS = 18 FIELDNAME = 'MAKTX' TABNAME = 'LT_MAT' SELTEXT_M = 'Material Description' ) ).

  "Display ALV
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      I_CALLBACK_PROGRAM = SY-REPID
      IT_FIELDCAT        = LT_FIELDCAT
    TABLES
      T_OUTTAB           = LT_MAT
    EXCEPTIONS
      PROGRAM_ERROR      = 1
      OTHERS             = 2.
  IF SY-SUBRC <> 0.
    MESSAGE E002(ZCS_MSG).
  ENDIF.

*  LOOP AT LT_MAT INTO DATA(LS_MAT).
*    WRITE : / LS_MAT-MATNR,
*              LS_MAT-MTART,
*              LS_MAT-MATKL,
*              LS_MAT-ERSDA,
*              LS_MAT-ERNAM,
*              LS_MAT-BRGEW,
*              LS_MAT-MEINS,
*              LS_MAT-NTGEW,
*              LS_MAT-MBRSH,
*              LS_MAT-WERKS,
*              LS_MAT-PSTAT,
*              LS_MAT-WEBAZ,
*              LS_MAT-BSTMA,
*              LS_MAT-BSTRF,
*              LS_MAT-FHORI,
*              LS_MAT-LOSFX,
*              LS_MAT-BSTMI,
*              LS_MAT-MAKTX.
*  ENDLOOP.