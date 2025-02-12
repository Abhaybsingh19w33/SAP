*&---------------------------------------------------------------------*
*& Report  ZZSIVA_02_JAPANESE_MATERIAL
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zzsiva_02_japanese_material.

TYPES : BEGIN OF ty_mara,
          matnr TYPE matnr,
          matkl TYPE matkl,
          spras TYPE spras,
          maktx TYPE maktx,
        END OF ty_mara.

DATA :  it_mara TYPE TABLE OF ty_mara,
        wa_mara TYPE ty_mara.

PARAMETERS : p_matnr TYPE matnr,
             p_spras TYPE spras.

SELECT mara~matnr mara~matkl makt~spras makt~maktx
  FROM mara AS mara INNER JOIN makt AS makt
  ON mara~matnr = makt~matnr
  INTO TABLE it_mara
  WHERE mara~matnr = p_matnr
  AND   makt~spras = p_spras.

LOOP AT it_mara INTO wa_mara.
  WRITE :/ wa_mara-matnr , wa_mara-matkl , wa_mara-spras, wa_mara-maktx.
ENDLOOP.