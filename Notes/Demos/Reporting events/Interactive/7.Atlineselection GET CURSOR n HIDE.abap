*&---------------------------------------------------------------------*
*& Report ZRTC_HIDE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrtc_hide.
DATA:
  it_kna1 TYPE TABLE  OF kna1,
  wa_kna1 TYPE kna1,
  wa_knbk TYPE knbk,
  it_knbk TYPE TABLE  OF knbk.

DATA : fname       TYPE char20,
       fvalue      TYPE kunnr,
       fvalue_conv TYPE kunnr.

SELECT * FROM kna1 INTO  TABLE it_kna1." UP TO 10 ROWS.

LOOP AT it_kna1 INTO wa_kna1.
  "Hotspot will convert arrow to hand in the output and make it evident which field to be clicked by user.
  WRITE : / wa_kna1-kunnr HOTSPOT, wa_kna1-land1, wa_kna1-name1.
ENDLOOP.

AT LINE-SELECTION.
  GET CURSOR FIELD fname VALUE fvalue.
  
  CASE sy-lsind.
    WHEN 1.
    IF fname = 'WA_KNA1-KUNNR'.
      " to convert kunnr to internal format.
      CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
        EXPORTING
          input  = fvalue
        IMPORTING
          output = fvalue_conv.

  	  SELECT * FROM knbk INTO TABLE it_knbk WHERE kunnr = fvalue_conv.
      
      LOOP AT it_knbk INTO wa_knbk.
        WRITE : / wa_kna1-kunnr, wa_knbk-banks, wa_knbk-bankl, wa_knbk-bankn.
      ENDLOOP.
      ENDIF.
  ENDCASE.