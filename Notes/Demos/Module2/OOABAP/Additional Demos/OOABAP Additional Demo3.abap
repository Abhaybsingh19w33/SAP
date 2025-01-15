*&---------------------------------------------------------------------*
*& ZTRCAP_OOABAP_METH1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTRCAP_OOABAP_METH1.

TABLES: MARA, MAKT.

TYPES : BEGIN OF TY_TAB,
          MATNR TYPE MATNR,
          MTART TYPE MTART,
          MEINS TYPE MEINS,
          MAKTX TYPE MAKTX,
        END OF TY_TAB.

DATA : IT_TAB TYPE STANDARD TABLE OF TY_TAB,
       WA_TAB TYPE TY_TAB.

SELECT-OPTIONS S_MATNR FOR MARA-MATNR.

START-OF-SELECTION.

DATA  OBJ TYPE REF TO ZTRCAP_GLB_CLASS_METH1.

  CREATE OBJECT OBJ.

  CALL METHOD OBJ->MATERIALS
    EXPORTING
      I_PMATNR1 = S_MATNR-LOW
      I_PMATNR2 = S_MATNR-HIGH
    IMPORTING
      E_LIST    = IT_TAB
*    EXCEPTIONS
*     MATERIAL_NOT_FOUND = 1
*     OTHERS    = 2
    .
  IF SY-SUBRC <> 0.
*   Implement suitable error handling here
  ENDIF.

  LOOP AT IT_TAB INTO WA_TAB.

    WRITE : / WA_TAB-MATNR,
              WA_TAB-MTART,
              WA_TAB-MEINS,
              WA_TAB-MAKTX.

  ENDLOOP.