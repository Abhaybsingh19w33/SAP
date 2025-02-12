*&---------------------------------------------------------------------*
*& Report  ZZSIVA_03_MATERIALS_LIST
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zzsiva_03_materials_list.

TABLES mara.

PARAMETERS : p_ernam TYPE mara-ernam.

SELECT * FROM mara where ernam = p_ernam.
  WRITE :/ mara-matnr, mara-ersda, mara-ernam.
ENDSELECT.