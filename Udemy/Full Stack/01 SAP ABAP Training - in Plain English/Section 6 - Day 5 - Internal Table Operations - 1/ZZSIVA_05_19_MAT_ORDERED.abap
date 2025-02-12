*&---------------------------------------------------------------------*
*& Report  ZZSIVA_05_SALES_BY_MAT
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zzsiva_05_mat_ordered.

TABLES : vbap.

SELECT-OPTIONS : s_vbeln FOR vbap-vbeln,
                 s_matnr FOR vbap-matnr.

TYPES : BEGIN OF ty_vbap,
          matnr TYPE matnr,
        END OF ty_vbap.

DATA : it_vbap TYPE TABLE OF ty_vbap,
       wa_vbap TYPE ty_vbap.

DATA : new_po TYPE c.

SELECT matnr FROM vbap INTO TABLE it_vbap
  WHERE vbeln IN s_vbeln
  AND   matnr IN s_matnr.

SORT it_vbap BY matnr.

delete ADJACENT DUPLICATES FROM it_vbap.

LOOP AT it_vbap INTO wa_vbap.

write :/ wa_vbap-matnr.
ENDLOOP.