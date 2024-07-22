*&---------------------------------------------------------------------*
*& Report ZCS_NEW_SYNTAX
*&---------------------------------------------------------------------*
REPORT ZCS_NEW_SYNTAX2.

*&---------------------------------------------------------------------*
*& Inline Declaration
*& Value Operator
*& line_index function
*& new syntax for reading internal table   ittab[ col = .. ]
*&---------------------------------------------------------------------*

*&---------------------Type Declaration--------------------------------*
TYPES : BEGIN OF TY_OUT,
          MATNR TYPE MARA-MATNR,
          MTART TYPE MARA-MTART,
          MATKL TYPE MARA-MATKL,
          ERSDA TYPE MARA-ERSDA,
          ERNAM TYPE MARA-ERNAM,
          BRGEW TYPE MARA-BRGEW,
          MEINS TYPE MARA-MEINS,
          NTGEW TYPE MARA-NTGEW,
          MBRSH TYPE MARA-MBRSH,
          WERKS TYPE MARC-WERKS,
          PSTAT TYPE MARC-PSTAT,
          WEBAZ TYPE MARC-WEBAZ,
          BSTMA TYPE MARC-BSTMA,
          BSTRF TYPE MARC-BSTRF,
          FHORI TYPE MARC-FHORI,
          LOSFX TYPE MARC-LOSFX,
          BSTMI TYPE MARC-BSTMI,
          MAKTX TYPE MAKT-MAKTX,
        END OF TY_OUT,

        TT_OUT TYPE STANDARD TABLE OF TY_OUT.

*&---------------------Data Declaration--------------------------------*
DATA : GV_MATNR    TYPE MARA-MATNR,
       LT_FIELDCAT TYPE TABLE OF SLIS_FIELDCAT_ALV,
       LT_OUT      TYPE TT_OUT.
*&---------------------Selection Screen--------------------------------*
SELECT-OPTIONS : SO_MATNR FOR GV_MATNR.

AT SELECTION-SCREEN.
  IF SO_MATNR-LOW IS INITIAL AND SO_MATNR-HIGH IS INITIAL.
    MESSAGE E000(ZCS_MSG).
  ENDIF.

START-OF-SELECTION.
  "Fetch data for material from MARA, MARC, MAKT
  SELECT MATNR,
         MTART,
         MATKL,
         ERSDA,
         ERNAM,
         BRGEW,
         MEINS,
         NTGEW,
         MBRSH
         FROM MARA
         INTO TABLE @DATA(LT_MARA)
         WHERE MATNR IN @SO_MATNR.
  IF SY-SUBRC <> 0.
    MESSAGE E001(ZCS_MSG).
  ELSE.

    SORT LT_MARA BY MATNR.

    SELECT MATNR,
           WERKS,
           PSTAT,
           WEBAZ,
           BSTMA,
           BSTRF,
           FHORI,
           LOSFX,
           BSTMI
           FROM MARC
           INTO TABLE @DATA(LT_MARC)
           FOR ALL ENTRIES IN @LT_MARA
           WHERE MATNR = @LT_MARA-MATNR.
    IF SY-SUBRC = 0.
      SORT LT_MARC BY MATNR.
    ENDIF.

    SELECT MATNR,
           SPRAS,
           MAKTX
           FROM MAKT
           INTO TABLE @DATA(LT_MAKT)
           FOR ALL ENTRIES IN @LT_MARA
           WHERE MATNR = @LT_MARA-MATNR.
    IF SY-SUBRC = 0.
      SORT LT_MAKT BY MATNR.
    ENDIF.
  ENDIF.

END-OF-SELECTION.

  LOOP AT LT_MARA ASSIGNING FIELD-SYMBOL(<FS_MARA>).

    DATA(LV_MAKTX) = LT_MAKT[ MATNR = <FS_MARA>-MATNR ].

    IF LV_MAKTX IS INITIAL.
      CLEAR LV_MAKTX.
    ENDIF.

    DATA(LV_INDEX) = LINE_INDEX( LT_MARC[ MATNR = <FS_MARA>-MATNR ] ).

    IF LV_INDEX <> 0.
      LOOP AT LT_MARC ASSIGNING FIELD-SYMBOL(<FS_MARC>) FROM LV_INDEX.
        IF <FS_MARC>-MATNR <> <FS_MARA>-MATNR.
          EXIT.
        ENDIF.

        APPEND INITIAL LINE TO LT_OUT ASSIGNING FIELD-SYMBOL(<FS_OUT>).

        MOVE-CORRESPONDING <FS_MARA> TO <FS_OUT>.
        MOVE-CORRESPONDING <FS_MARC> TO <FS_OUT>.
        <FS_OUT>-MAKTX = LV_MAKTX.
      ENDLOOP.
    ENDIF.
  ENDLOOP.

  " Field-catalog for ALV
  LT_FIELDCAT = VALUE #( ( COL_POS = 1 FIELDNAME = 'MATNR' TABNAME = 'LT_OUT' SELTEXT_M = 'Material Number' )
                         ( COL_POS = 2 FIELDNAME = 'MTART' TABNAME = 'LT_OUT' SELTEXT_M = 'Material Type' )
                         ( COL_POS = 3 FIELDNAME = 'MATKL' TABNAME = 'LT_OUT' SELTEXT_M = 'Material Group' )
                         ( COL_POS = 4 FIELDNAME = 'ERSDA' TABNAME = 'LT_OUT' SELTEXT_M = 'Created On' )
                         ( COL_POS = 5 FIELDNAME = 'ERNAM' TABNAME = 'LT_OUT' SELTEXT_M = 'Name of Person Responsible for Creating the Object' )
                         ( COL_POS = 6 FIELDNAME = 'BRGEW' TABNAME = 'LT_OUT' SELTEXT_M = 'Gross Weight' )
                         ( COL_POS = 7 FIELDNAME = 'MEINS' TABNAME = 'LT_OUT' SELTEXT_M = 'Base Unit of Measure' )
                         ( COL_POS = 8 FIELDNAME = 'NTGEW' TABNAME = 'LT_OUT' SELTEXT_M = 'Net Weight' )
                         ( COL_POS = 9 FIELDNAME = 'MBRSH' TABNAME = 'LT_OUT' SELTEXT_M = 'Industry Sector' )
                         ( COL_POS = 10 FIELDNAME = 'WERKS' TABNAME = 'LT_OUT' SELTEXT_M = 'Plant' )
                         ( COL_POS = 11 FIELDNAME = 'PSTAT' TABNAME = 'LT_OUT' SELTEXT_M = 'Maintenance status' )
                         ( COL_POS = 12 FIELDNAME = 'WEBAZ' TABNAME = 'LT_OUT' SELTEXT_M = 'Goods receipt processing time in days' )
                         ( COL_POS = 13 FIELDNAME = 'BSTMA' TABNAME = 'LT_OUT' SELTEXT_M = 'Maximum Lot Size' )
                         ( COL_POS = 14 FIELDNAME = 'BSTRF' TABNAME = 'LT_OUT' SELTEXT_M = 'Rounding value for purchase order quantity' )
                         ( COL_POS = 15 FIELDNAME = 'FHORI' TABNAME = 'LT_OUT' SELTEXT_M = 'Scheduling Margin Key for Floats' )
                         ( COL_POS = 16 FIELDNAME = 'LOSFX' TABNAME = 'LT_OUT' SELTEXT_M = 'Ordering costs' )
                         ( COL_POS = 17 FIELDNAME = 'BSTMI' TABNAME = 'LT_OUT' SELTEXT_M = 'Minimum Lot Size' )
                         ( COL_POS = 18 FIELDNAME = 'MAKTX' TABNAME = 'LT_OUT' SELTEXT_M = 'Material Description' ) ).

  "Display ALV
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      I_CALLBACK_PROGRAM = SY-REPID
      IT_FIELDCAT        = LT_FIELDCAT
    TABLES
      T_OUTTAB           = LT_OUT
    EXCEPTIONS
      PROGRAM_ERROR      = 1
      OTHERS             = 2.
  IF SY-SUBRC <> 0.
    MESSAGE E002(ZCS_MSG).
  ENDIF.