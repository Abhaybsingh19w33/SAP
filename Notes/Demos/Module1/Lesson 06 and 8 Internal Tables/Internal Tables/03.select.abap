*&---------------------------------------------------------------------*
*& Report ZRT_INTERNALTABLE_3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrt_internaltable_3.

DATA: v_land1 TYPE land1.
SELECT-OPTIONS  s_land1  FOR v_land1.

TYPES :BEGIN OF ty_kna1,
        kunnr TYPE kunnr, "customer no
        land1 TYPE land1_gp, "ctry
        name1 TYPE name1_gp, "name
        ort01 TYPE ort01_gp,
       END   OF ty_kna1.

DATA : it_kna1 TYPE TABLE OF ty_kna1,
       wa_kna1 TYPE          ty_kna1.

SELECT kunnr land1 name1 ort01
        INTO TABLE it_kna1 FROM kna1
                      WHERE land1 IN s_land1.

IF it_kna1 IS NOT INITIAL.
  LOOP AT it_kna1 INTO wa_kna1.
    WRITE : / wa_kna1-kunnr COLOR 1,
              wa_kna1-land1 ,
              wa_kna1-name1 CENTERED COLOR 3,
              wa_kna1-ort01.
  ENDLOOP.
ELSE.
  WRITE : / 'NO Data for the Given Ctry', s_land1-low color 7.
ENDIF.