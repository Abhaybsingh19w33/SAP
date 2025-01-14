*&---------------------------------------------------------------------*
*& Report ZRTC_HIDE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrtc_hide.
DATA:
  it_kna1   TYPE TABLE OF kna1,
  wa_kna1   TYPE kna1,
  lv_fname  TYPE char20,
  lv_fvalue TYPE char10.

SELECT * FROM kna1 INTO  TABLE it_kna1 UP TO 10 ROWS.

LOOP AT it_kna1 INTO wa_kna1.
  WRITE : / wa_kna1-kunnr, wa_kna1-land1, wa_kna1-name1.
ENDLOOP.

AT LINE-SELECTION.
  GET CURSOR FIELD lv_fname VALUE lv_fvalue.

    IF lv_fname = 'WA_KNA1-KUNNR'.
      WINDOW STARTING AT 5 10
      ENDING AT 55 12  .
      WRITE : /  'Customer is ' color 2 , lv_fvalue.
    ENDIF.

    IF lv_fname = 'WA_KNA1-LAND1'.
      WINDOW STARTING AT 20 10
      ENDING AT 30 30.
      WRITE : /  'Land is ' color 1 , lv_fvalue.
    ENDIF.