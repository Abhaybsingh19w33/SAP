*&---------------------------------------------------------------------*
*& Report ZRT_IT_DEMO12
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZRT_IT_DEMO12.

*TYPES:
*  BEGIN OF ty_stocks,
*    ebeln TYPE zebeln,
*    lifnr TYPE zlifnr,
*    aedat TYPE erdat,
*    ebelp TYPE ebelp,
*    matnr TYPE matnr,
*    menge TYPE menge_d,
*    netpr TYPE bprei,
*
*  END OF ty_stocks.

data : it_stocks type table of ZRT_EKKO_view,
       wa_stocks type ZRT_EKKO_view.

SELECT *
   INTO TABLE it_stocks
   FROM ZRT_EKKO_view ."view is ZRT_EKKO_view

LOOP AT it_stocks INTO wa_stocks .
  WRITE : / wa_stocks-ebeln color 1 ,
           wa_stocks-lifnr,
           wa_stocks-aedat color 3,
           wa_stocks-matnr color 2 centered,
           wa_stocks-menge,
           wa_stocks-netpr.
ENDLOOP.