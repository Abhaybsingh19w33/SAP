*&---------------------------------------------------------------------*
*& Report ZCS_NEW_SYNTAX
*&---------------------------------------------------------------------*
REPORT ZCS_NEW_SYNTAX.

*&---------------------------------------------------------------------*
*& Inline Declaration
*& Value Operator
*& New Concat operator
*& ALPHA conv IN OUT
*& COND operator
*&---------------------------------------------------------------------*

DATA:
*      LT_EKKO           TYPE STANDARD TABLE OF EKKO,
*      LV_STR_PO         TYPE STRING,
       L_TAB_DOCTYP      TYPE RANGE OF ESART.
*      L_WA_DOCTYP       LIKE LINE OF L_TAB_DOCTYP,
*      L_ORD_DESCRIPTION TYPE STRING.
*FIELD-SYMBOLS : <FS_EKKO> TYPE EKKO.

*L_WA_DOCTYP-SIGN = 'I'.
*L_WA_DOCTYP-OPTION = 'EQ'.
*L_WA_DOCTYP-LOW = 'ZSO'.
*APPEND L_WA_DOCTYP TO L_TAB_DOCTYP.
*
*L_WA_DOCTYP-SIGN = 'I'.
*L_WA_DOCTYP-OPTION = 'EQ'.
*L_WA_DOCTYP-LOW = 'ZEM'.
*APPEND L_WA_DOCTYP TO L_TAB_DOCTYP.

" VALUE operator
L_TAB_DOCTYP = VALUE #( ( SIGN = 'I' OPTION = 'EQ' LOW = 'ZSO' )
                        ( SIGN = 'I' OPTION = 'EQ' LOW = 'ZEM' ) ).

SELECT EBELN,
       PINCR,
       BSART,
       WAERS
  UP TO 30 ROWS
  FROM EKKO
  INTO TABLE @DATA(LT_EKKO) " inline declaration
  WHERE BSART IN @L_TAB_DOCTYP.

LOOP AT LT_EKKO ASSIGNING FIELD-SYMBOL(<FS_EKKO>). "inline declaration
*  CONCATENATE 'PO number:'
*              <FS_EKKO>-EBELN
*              INTO LV_STR_PO
*              SEPARATED BY SPACE.
*
*  WRITE : / LV_STR_PO.

* new string concatenation
  WRITE : / |PO number: | && <FS_EKKO>-EBELN.

*  CALL FUNCTION 'CONVERSION_EXIT_ALPHA_OUTPUT'
*    EXPORTING
*      INPUT  = <FS_EKKO>-PINCR
*    IMPORTING
*      OUTPUT = <FS_EKKO>-PINCR.
*
*  WRITE : <FS_EKKO>-PINCR.

* NEW alpha conversion
  WRITE : | { <FS_EKKO>-PINCR ALPHA = OUT } |.

*  IF <FS_EKKO>-BSART = 'ZEM' AND <FS_EKKO>-WAERS = 'USD'.
*    L_ORD_DESCRIPTION = 'Emergency Order in United States'.
*  ELSEIF <FS_EKKO>-BSART = 'ZEM' AND <FS_EKKO>-WAERS = 'EUR'.
*    L_ORD_DESCRIPTION = 'Emergency Order in Europe'.
*  ELSEIF <FS_EKKO>-BSART = 'ZEM'.
*    L_ORD_DESCRIPTION = 'Emergency Order - Others'.
*  ENDIF.
*
*  WRITE : L_ORD_DESCRIPTION.

* COND OPERATOR
  WRITE : COND #( WHEN <FS_EKKO>-BSART = 'ZEM' AND <FS_EKKO>-WAERS = 'USD'
                    THEN 'Emergency Order in United States'
                  WHEN <FS_EKKO>-BSART = 'ZEM' AND <FS_EKKO>-WAERS = 'EUR'
                    THEN 'Emergency Order in Europe'
                  WHEN <FS_EKKO>-BSART = 'ZEM'
                    THEN 'Emergency Order - Others' ).
ENDLOOP.