*&---------------------------------------------------------------------*
*& Report ZTRCAP_INTERACTIVE_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTRCAP_INTERACTIVE_REPORT NO STANDARD PAGE HEADING LINE-COUNT 15(2) LINE-SIZE 50 MESSAGE-ID ZTR_MSG1.
TABLES MARA.

TYPES : BEGIN OF TY_TAB,  " LOCAL STRS MARA
          MATNR TYPE MATNR , " Material Number
          MBRSH TYPE MBRSH,  " Industry sector
          MTART TYPE MTART,  " Material Group
          MEINS TYPE MEINS,  " Base Unit of Measure
        END OF TY_TAB.

DATA :IT_TAB TYPE STANDARD TABLE OF TY_TAB, "  ITAB
      WA_TAB TYPE TY_TAB.  " WORKAREA

TYPES : BEGIN OF TY_TAB1,  " LOCAL STRS MARC
          MATNR TYPE MATNR ,  " Material Number
          WERKS TYPE WERKS_D, " Plant
          MEINS TYPE MEINS,   " Base Unit of Measure
        END OF TY_TAB1.

DATA :IT_TAB1 TYPE STANDARD TABLE OF TY_TAB1, "  ITAB
      WA_TAB1 TYPE TY_TAB1.  " WORKAREA

TYPES : BEGIN OF TY_TAB2,  " LOCAL STRS MAKT
          MATNR TYPE MATNR ,  " Material Number
          MAKTX TYPE MAKTX,   " Material description
        END OF TY_TAB2.

DATA :IT_TAB2 TYPE STANDARD TABLE OF TY_TAB2, "  ITAB
      WA_TAB2 TYPE TY_TAB2.  " WORKAREA

DATA LV_MATNR TYPE MATNR.


SELECT-OPTIONS S_MATNR FOR MARA-MATNR.


START-OF-SELECTION.
  SELECT MATNR
         MBRSH
         MTART
         MEINS
    FROM MARA
    INTO TABLE IT_TAB
    WHERE MATNR IN S_MATNR.

END-OF-SELECTION.

  LOOP AT IT_TAB INTO WA_TAB.  "BODY TO HEADER
    WRITE : / SY-TABIX,
              WA_TAB-MATNR ,   " M01
              WA_TAB-MBRSH,
              WA_TAB-MTART,
              WA_TAB-MEINS.

    HIDE WA_TAB-MATNR. " M01
  ENDLOOP.
  WRITE: 'LIST INDEX IS  : ', SY-LSIND.

*
TOP-OF-PAGE.
  WRITE / 'MAT MASTER DATA FROM MARA TABLE'.
*    WRITE:  'MAT NO',
*          20 'IND SECTOR',
*          22 'MAT TYPE',
*          27 'BASE '.
*
END-OF-PAGE.
  WRITE : 'PAGE NO: ', SY-PAGNO.

AT LINE-SELECTION.
  CASE SY-LSIND.
    WHEN 1.
      SELECT MATNR
             WERKS
         FROM MARC
        INTO TABLE IT_TAB1
      WHERE MATNR EQ WA_TAB-MATNR. " HIDE VALUE.

      LOOP AT IT_TAB1 INTO WA_TAB1.  " MARC
        WRITE : / SY-TABIX,
                  WA_TAB1-MATNR,
                  WA_TAB1-WERKS.
        HIDE  : WA_TAB1-MATNR .
      ENDLOOP.
      WRITE: 'LIST INDEX IS  : ', SY-LSIND.

    WHEN 2.
      SELECT MATNR
            MAKTX
          FROM MAKT
        INTO TABLE IT_TAB2
        WHERE MATNR EQ WA_TAB1-MATNR.

      LOOP AT IT_TAB2 INTO WA_TAB2.
          WRITE : / SY-TABIX,
                    WA_TAB2-MATNR,
                    WA_TAB2-MAKTX.

      ENDLOOP.
      WRITE: 'LIST INDEX IS  : ', SY-LSIND.
  ENDCASE.

TOP-OF-PAGE DURING LINE-SELECTION .
  CASE SY-LSIND.
    WHEN 1.
      WRITE / 'MAT MASTER DATA FROM MARC TABLE'.
    WHEN 2.
      WRITE / 'MAT MASTER DATA FROM MAKT TABLE'.  
  ENDCASE.