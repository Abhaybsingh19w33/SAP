*&---------------------------------------------------------------------*
*& Report  ZZSIVA_02_JA_MAT_STOCK
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zzsiva_02_ja_mat_stock.

TYPES : BEGIN OF ty_mat,
          matnr TYPE matnr,
          matkl TYPE matkl,
          spras TYPE spras,
          maktx TYPE maktx,
          werks TYPE werks,
          labst TYPE labst,
        END OF ty_mat.


DATA : it_mat TYPE TABLE OF ty_mat,
       wa_mat TYPE ty_mat.

PARAMETERS : p_matnr TYPE matnr,
             p_spras TYPE spras.

SELECT mara~matnr mara~matkl makt~spras makt~maktx mard~werks mard~labst
  FROM mara AS mara INNER JOIN makt AS makt
  ON mara~matnr = makt~matnr
  INNER JOIN mard AS mard ON mara~matnr = mard~matnr
  INTO TABLE it_mat
  WHERE mara~matnr = p_matnr
  AND makt~spras = p_spras.


LOOP AT it_mat INTO wa_mat.

  WRITE : / wa_mat-matnr, wa_mat-matkl, wa_mat-spras,
            wa_mat-maktx, wa_mat-werks, wa_mat-labst.

ENDLOOP.