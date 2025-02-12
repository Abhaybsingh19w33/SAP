*&---------------------------------------------------------------------*
*& Report  ZZSIVA_02_SALES_ORDERS
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zzsiva_02_sales_orders.

TABLES : zorder.

PARAMETERS  p_order TYPE zorder-order_num.
PARAMETERS  p_mat TYPE zzmaterial.

SELECT * FROM zorder
  WHERE order_num = p_order
  AND   material = p_mat.
  WRITE : / zorder-order_num.
  write : 11(20) zorder-cust_num , zorder-creation_date,
            zorder-item , zorder-material.
ENDSELECT.