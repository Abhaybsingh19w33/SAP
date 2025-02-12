*&---------------------------------------------------------------------*
*& Report  ZZSIVA_04_SALES_ORDERS
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zzsiva_04_sales_orders.

TABLES : vbak , vbap.

select-OPTIONS : s_vbeln FOR vbak-vbeln,
                 s_matnr for vbap-matnr,
                 s_erdat for vbak-erdat,
                 s_ernam for vbak-ernam.

TYPES : BEGIN OF ty_order,
          vbeln   TYPE vbeln_va,
          ernam   TYPE ernam,
          erdat   TYPE erdat,
          posnr   TYPE posnr,
          matnr   TYPE matnr,
          kwmeng  TYPE kwmeng,
          netwr   TYPE netwr,
      END OF ty_order.

DATA : it_order TYPE TABLE OF ty_order,
       wa_order TYPE ty_order.

SELECT vbak~vbeln vbak~ernam vbak~erdat vbap~posnr vbap~matnr vbap~kwmeng vbap~netwr
  FROM vbak AS vbak INNER JOIN vbap AS vbap
  ON vbak~vbeln = vbap~vbeln
  INTO TABLE it_order
  WHERE vbak~vbeln in s_vbeln
  AND   vbak~ernam in s_ernam
  AND   vbak~erdat in s_erdat
  AND   vbap~matnr in s_matnr.

FORMAT COLOR 2.
  write :/ 'Order Num ' , 'Created by  ','Created On','Item  ','Material          ','Quantity         ','Value     '.
FORMAT COLOR OFF.

LOOP AT it_order INTO wa_order.

  WRITE :/ wa_order-vbeln, wa_order-ernam , wa_order-erdat, wa_order-posnr, wa_order-matnr.
  write wa_order-kwmeng LEFT-JUSTIFIED.
  write wa_order-netwr.

ENDLOOP.