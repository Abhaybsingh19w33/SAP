*&---------------------------------------------------------------------*
*& Report  ZZSIVA_05_SALES_BY_MAT
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zzsiva_05_sales_by_order.

TABLES : vbap.

SELECT-OPTIONS : s_vbeln FOR vbap-vbeln,
                 s_matnr FOR vbap-matnr.

TYPES : BEGIN OF ty_vbap,
          vbeln TYPE vbeln,
          posnr TYPE posnr,
          matnr TYPE matnr,
          netwr TYPE netwr,
        END OF ty_vbap.

DATA : it_vbap TYPE TABLE OF ty_vbap,
       wa_vbap TYPE ty_vbap.

DATA : new_po TYPE c.

SELECT vbeln posnr matnr netwr FROM vbap INTO TABLE it_vbap
  WHERE vbeln IN s_vbeln
  AND   matnr IN s_matnr.

SORT it_vbap BY vbeln.

LOOP AT it_vbap INTO wa_vbap.

  AT FIRST.
    WRITE :/ 'Order' COLOR 1, 12 'item' COLOR 2, 19 'Material' COLOR 2, 50 'Value' COLOR 3.
  ENDAT.

  AT NEW vbeln.
    new_po = 'X'.
  ENDAT.

  IF new_po = 'X'.
    WRITE :/ wa_vbap-vbeln, wa_vbap-posnr, wa_vbap-matnr, wa_vbap-netwr.
    new_po = ' '.
  Else.
    WRITE :/12 wa_vbap-posnr, wa_vbap-matnr, wa_vbap-netwr.
  ENDIF.


  AT END OF vbeln.
    SUM.
    WRITE :/39 wa_vbap-netwr COLOR 5.
  ENDAT.

ENDLOOP.