*&---------------------------------------------------------------------*
*& Report  ZZSIVA_02_ELECTRONICS
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zzsiva_02_electronics.

TYPES : BEGIN OF ty_mara,
          matnr TYPE matnr,
          ersda TYPE ersda,
          matkl TYPE matkl,
        END OF ty_mara.

DATA : it_mara TYPE TABLE OF ty_mara,
       wa_mara TYPE ty_mara.


PARAMETERS : p_matkl TYPE matkl.

select matnr ersda matkl from mara into table it_mara WHERE matkl = p_matkl.

loop at it_mara INTO wa_mara.
  write : / wa_mara-matnr , wa_mara-ersda , wa_mara-matkl.
  ENDLOOP.