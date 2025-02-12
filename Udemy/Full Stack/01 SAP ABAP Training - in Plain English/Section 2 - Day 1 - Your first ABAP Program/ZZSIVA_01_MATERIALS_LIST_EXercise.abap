*&---------------------------------------------------------------------*
*& Report  ZZSIVA_04_MATERIALS_LIST_EX
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zzsiva_04_materials_list_ex.

TABLES : zcust01.

SELECT * FROM zcust01.
  WRITE : / zcust01-cust_num , zcust01-cust_name.
ENDSELECT.