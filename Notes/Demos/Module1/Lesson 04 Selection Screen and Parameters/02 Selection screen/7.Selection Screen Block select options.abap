REPORT zrpt_beginners_sap_01.

DATA: v_kunnr TYPE kunnr,
      v_land1 TYPE land1.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
  SELECT-OPTIONS: s_kunnr FOR v_kunnr.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE text-002.
  PARAMETERS :  rb1 RADIOBUTTON GROUP g1,
                rb2 RADIOBUTTON GROUP g1,
                rb3 RADIOBUTTON GROUP g1.
SELECTION-SCREEN END OF BLOCK b2.

START-OF-SELECTION.
  IF rb1 = 'X'.
    v_land1 = 'DE'.
  ELSEIF rb2 = 'X'.
    v_land1 = 'US'.
  ELSEIF rb3 = 'X'.
    v_land1 = 'GB'.
  ENDIF.

  write :/ s_kunnr-low, s_kunnr-high.
  write : v_land1.