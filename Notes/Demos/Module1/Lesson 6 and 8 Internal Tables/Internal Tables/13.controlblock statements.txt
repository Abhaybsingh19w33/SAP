*&---------------------------------------------------------------------*
*& Report ZRTC_STOCKS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrtc_ekkojoin.

TYPES:
  BEGIN OF ty_stocks,
    ebeln TYPE zebeln,
    lifnr TYPE zlifnr,
    aedat TYPE erdat,
    ebelp TYPE ebelp,
    matnr TYPE matnr,
    menge TYPE menge_d,
    netpr TYPE bprei,

  END OF ty_stocks.

DATA : it_stocks TYPE TABLE OF ty_stocks,
       wa_stocks TYPE ty_stocks.

SELECT zekko~ebeln
        zekko~lifnr
        zekko~aedat
        zekpo~ebelp
        zekpo~matnr
         zekpo~menge
        zekpo~netpr
   INTO TABLE it_stocks
   FROM zekko INNER JOIN zekpo
  ON  zekko~ebeln = zekpo~ebeln.

SORT it_stocks BY ebeln ASCENDING."bbydefaullt ascending
LOOP AT it_stocks INTO wa_stocks .
  AT FIRST .
    WRITE :/ 'Purchse list' COLOR 4.
    uline.
  ENDAT.

  AT NEW  ebeln.
    WRITE :/ wa_stocks-ebeln COLOR 1 .
  ENDAT.

  WRITE : /
           wa_stocks-lifnr,
           wa_stocks-aedat COLOR 3,
           wa_stocks-aedat,
           wa_stocks-ebelp,
           wa_stocks-matnr COLOR 2 CENTERED,
           wa_stocks-menge,
           wa_stocks-netpr.

  AT END OF ebeln.
    SUM.
    WRITE: /10 'Subtotal of Po:' COLOR 1 , wa_stocks-netpr COLOR 4.
  ENDAT.

  AT LAST.
    SUM.
    WRITE :/30 'Total of all POs:'  COLOR 1 , wa_stocks-netpr COLOR 4.
  ENDAT.

ENDLOOP.