*&---------------------------------------------------------------------*
*& Report  ZZSIVA_02_PURCHASE_ORDERS
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZZSIVA_02_PURCHASE_ORDERS.

TABLES : zporder.

PARAMETERS : p_order    TYPE zporder-ORDER_NUM,
             p_mat      TYPE zporder-material.


SELECT * from zporder WHERE order_num = p_order AND material = p_mat.
  write : / zporder-order_num , zporder-line , zporder-material.
  ENDSELECT.