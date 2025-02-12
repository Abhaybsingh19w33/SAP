*&---------------------------------------------------------------------*
*& Report  ZZSIVA_03_COUNTRIES_LIST
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zzsiva_03_countries_list.

TABLES t005t.

SELECT * FROM t005t WHERE spras = 'EN'.
  WRITE t005t-land1.
  WRITE t005t-landx.
ENDSELECT.