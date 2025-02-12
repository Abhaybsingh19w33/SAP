*&---------------------------------------------------------------------*
*& Report  ZZSIVA_04_SALES_ORDERS
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zzsiva_04_orders_by_type.

TABLES : vbak , vbap.

SELECT-OPTIONS : s_vbeln FOR vbak-vbeln,
                 s_matnr FOR vbap-matnr,
                 s_erdat FOR vbak-erdat,
                 s_ernam FOR vbak-ernam.

PARAMETERS  : p_quote AS CHECKBOX.

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

IF p_quote IS NOT INITIAL.
  SELECT vbak~vbeln vbak~ernam vbak~erdat vbap~posnr vbap~matnr vbap~kwmeng vbap~netwr
    FROM vbak AS vbak INNER JOIN vbap AS vbap
    ON vbak~vbeln = vbap~vbeln
    INTO TABLE it_order
    WHERE vbak~vbeln IN s_vbeln
    AND   vbak~ernam IN s_ernam
    AND   vbak~erdat IN s_erdat
    AND   vbap~matnr IN s_matnr
    AND   vbak~vbtyp = 'B'.
ENDIF.

IF p_quote IS INITIAL.
  SELECT vbak~vbeln vbak~ernam vbak~erdat vbap~posnr vbap~matnr vbap~kwmeng vbap~netwr
    FROM vbak AS vbak INNER JOIN vbap AS vbap
    ON vbak~vbeln = vbap~vbeln
    INTO TABLE it_order
    WHERE vbak~vbeln IN s_vbeln
    AND   vbak~ernam IN s_ernam
    AND   vbak~erdat IN s_erdat
    AND   vbap~matnr IN s_matnr.
ENDIF.

FORMAT COLOR 2.
WRITE :/ 'Order Num ' , 'Created by  ','Created On','Item  ','Material          ','Quantity         ','Value     '.
FORMAT COLOR OFF.

LOOP AT it_order INTO wa_order.

  WRITE :/ wa_order-vbeln, wa_order-ernam , wa_order-erdat, wa_order-posnr, wa_order-matnr.
  WRITE wa_order-kwmeng LEFT-JUSTIFIED.
  WRITE wa_order-netwr.

ENDLOOP.