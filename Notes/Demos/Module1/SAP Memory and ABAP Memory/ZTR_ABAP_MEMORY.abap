*&---------------------------------------------------------------------*
*& Report ZTR_ABAP_MEMORY1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTR_ABAP_MEMORY1.


PARAMETERS P_MATNR TYPE MARA-MATNR.

EXPORT P_MATNR TO MEMORY ID 'CAPGM'.

SUBMIT ZTR_ABAP_MEMORY2 AND RETURN.

*&---------------------------------------------------------------------*
*& Report ZTR_ABAP_MEMORY2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTR_ABAP_MEMORY2.


TABLES : MARA.
TYPES : BEGIN OF TY_TAB,  " LOCAL STRS
       MATNR TYPE MATNR , " Material Number
       MBRSH TYPE MBRSH, " Industry sector
       MTART TYPE MTART, " Material Group
      MEINS TYPE MEINS, " Base Unit of Measure
END OF TY_TAB.

DATA :IT_TAB TYPE STANDARD TABLE OF TY_TAB, "  ITAB
      WA_TAB TYPE TY_TAB.  " WORKAREA

DATA P_MATNR TYPE MARA-MATNR.

*FREE MEMORY ID 'CAPGM'.

IMPORT P_MATNR FROM MEMORY ID 'CAPGM'.

START-OF-SELECTION.

SELECT MATNR
       MBRSH
       MTART
       MEINS
  FROM MARA
  INTO TABLE IT_TAB
  WHERE MATNR eq P_MATNR.


LOOP AT IT_TAB INTO WA_TAB.  "BODY TO HEADER
  WRITE : / SY-TABIX,
            WA_TAB-MATNR,
            WA_TAB-MBRSH,
            WA_TAB-MTART,
            WA_TAB-MEINS.
  ENDLOOP.