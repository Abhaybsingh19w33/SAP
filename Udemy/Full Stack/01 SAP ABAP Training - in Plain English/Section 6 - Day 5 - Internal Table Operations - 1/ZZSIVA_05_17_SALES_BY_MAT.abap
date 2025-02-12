*&---------------------------------------------------------------------*
*& Report  ZZSIVA_05_SALES_BY_MAT
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zzsiva_05_sales_by_mat.

TABLES : vbap.

SELECT-OPTIONS : s_vbeln FOR vbap-vbeln,
                 s_matnr FOR vbap-matnr.

TYPES : BEGIN OF ty_vbap,
          matnr TYPE matnr,
          netwr TYPE netwr,
        END OF ty_vbap.

DATA : it_vbap TYPE TABLE OF ty_vbap,
       wa_vbap TYPE ty_vbap.

SELECT matnr netwr FROM vbap INTO TABLE it_vbap
  WHERE vbeln IN s_vbeln
  AND   matnr IN s_matnr.

SORT it_vbap BY matnr.

LOOP AT it_vbap INTO wa_vbap.

  AT FIRST.
    WRITE :/ 'Material' COLOR 2, 30 'Value' COLOR 3.
  ENDAT.

  AT END OF matnr.
    sum.
    write :/ wa_vbap-matnr, wa_vbap-netwr.
  ENDAT.

ENDLOOP.