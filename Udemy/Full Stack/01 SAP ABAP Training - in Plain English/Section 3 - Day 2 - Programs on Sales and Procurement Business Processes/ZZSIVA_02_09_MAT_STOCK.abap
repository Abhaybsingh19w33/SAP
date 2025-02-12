*&---------------------------------------------------------------------*
*& Report  ZZSIVA_02_MAT_STOCK
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zzsiva_02_mat_stock.

TYPES : BEGIN OF ty_mat,
          matnr TYPE matnr,
          ernam TYPE ernam,
          werks TYPE werks,
          labst TYPE labst,
        END OF ty_mat.


DATA : it_mat TYPE TABLE OF ty_mat,
       wa_mat TYPE ty_mat.


PARAMETERS : p_matnr TYPE matnr.


SELECT mara~matnr mara~ernam mard~werks mard~labst INTO TABLE it_mat FROM mara AS mara left OUTER JOIN  mard AS mard
  ON mara~matnr = mard~matnr
  WHERE mara~matnr = p_matnr.

LOOP AT it_mat INTO wa_mat.
  WRITE : / wa_mat-matnr , wa_mat-ernam , wa_mat-werks , wa_mat-labst.
ENDLOOP.