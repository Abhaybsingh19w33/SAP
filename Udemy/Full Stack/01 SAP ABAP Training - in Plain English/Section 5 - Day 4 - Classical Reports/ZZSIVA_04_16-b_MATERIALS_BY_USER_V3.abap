REPORT  zzsiva_04_materials_by_user_v3 LINE-COUNT 30(1) NO STANDARD PAGE HEADING.

TABLES : mara, usr02.

SELECT-OPTIONS : s_matnr FOR mara-matnr,
                 s_ersda FOR mara-ersda,
                 s_ernam FOR mara-ernam MODIF ID crb.

PARAMETERS :  p_crtd AS CHECKBOX.

TYPES : BEGIN OF ty_mara,
          matnr TYPE matnr,
          ernam TYPE ernam,
          ersda TYPE ersda,
        END OF ty_mara.

DATA : it_mara TYPE TABLE OF ty_mara,
       wa_mara TYPE ty_mara.

AT SELECTION-SCREEN OUTPUT.

  LOOP AT  SCREEN.
    IF p_crtd IS NOT INITIAL.
      IF screen-group1 = 'CRB'.
        s_ernam-sign = 'I'.
        s_ernam-option = 'EQ'.
        s_ernam-low = sy-uname.

        APPEND s_ernam.

        screen-input = 0.
        MODIFY SCREEN.
      ENDIF.
    ENDIF.

  ENDLOOP.

AT SELECTION-SCREEN.

  IF s_ernam IS NOT INITIAL.
    SELECT SINGLE * FROM usr02 WHERE bname IN s_ernam.
    IF sy-subrc <> 0.
      MESSAGE 'User not found' TYPE 'E'.
    ENDIF.

  ENDIF.

AT SELECTION-SCREEN ON s_matnr.
  IF s_matnr IS NOT INITIAL.
    SELECT SINGLE * FROM mara WHERE matnr IN s_matnr.
    IF sy-subrc <> 0 .
      MESSAGE 'Material invalid' TYPE 'E'.
    ENDIF.
  ENDIF.

START-OF-SELECTION.

  SELECT matnr ernam ersda FROM mara INTO TABLE it_mara
    WHERE matnr IN s_matnr
    AND   ernam IN s_ernam.

  LOOP AT it_mara INTO wa_mara.
    WRITE : / wa_mara-matnr , wa_mara-ernam , wa_mara-ersda.
  ENDLOOP.

TOP-OF-PAGE.
  write:/ 'Material list by user' color 2.
  ULINE.
  write :/ 'Material' color 1, 20 'Created By' COLOR 2, 33 'Created On' COLOR 3.
  ULINE.

end-of-PAGE.
  write:/ '** Materials flagged for deletion are not displayed **' COLOR 7.