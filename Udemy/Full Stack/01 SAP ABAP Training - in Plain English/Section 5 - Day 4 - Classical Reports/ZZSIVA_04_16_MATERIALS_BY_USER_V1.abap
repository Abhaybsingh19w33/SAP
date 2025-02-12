*&---------------------------------------------------------------------*
*& Report  ZZSIVA_04_MATERIALS_BY_USER_V1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zzsiva_04_materials_by_user_v1.

TABLES : mara.

SELECT-OPTIONS : s_matnr FOR mara-matnr,
                 s_ernam FOR mara-ernam .

TYPES : BEGIN OF ty_mara,
          matnr TYPE matnr,
          ernam TYPE ernam,
          ersda TYPE ersda,
        END OF ty_mara.

DATA : it_mara TYPE TABLE OF ty_mara,
       wa_mara TYPE ty_mara.

INITIALIZATION.

s_ernam-sign = 'I'.
s_ernam-option = 'EQ'.
s_ernam-low = sy-uname.

append s_ernam.


START-OF-SELECTION.

  SELECT matnr ernam ersda FROM mara INTO TABLE it_mara
    WHERE matnr IN s_matnr
    AND   ernam IN s_ernam.

  LOOP AT it_mara INTO wa_mara.
    WRITE : / wa_mara-matnr , wa_maRA-ernam , wa_maRA-ersda.
  ENDLOOP.