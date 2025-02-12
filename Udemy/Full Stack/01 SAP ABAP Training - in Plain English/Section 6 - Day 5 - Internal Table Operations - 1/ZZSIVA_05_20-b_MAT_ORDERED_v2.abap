*&---------------------------------------------------------------------*
*& Report  ZZSIVA_05_ORDERS_V1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zzsiva_05_orders_v2.

TABLES:  vbak, tvakt, tcurt.

TYPES : BEGIN OF ty_vbak,
          vbeln TYPE vbak-vbeln,
          auart TYPE vbak-auart,
          bezei TYPE tvakt-bezei,
          erdat TYPE vbak-erdat,
          ernam TYPE vbak-ernam,
          waerk TYPE vbak-waerk,
          ltext TYPE tcurt-ltext,
        END OF ty_vbak.


DATA : it_vbak TYPE TABLE OF ty_vbak.
SELECT-OPTIONS :
  s_vbeln FOR vbak-vbeln,
  s_auart FOR vbak-auart,
  s_erdat FOR vbak-erdat,
  s_ernam FOR vbak-ernam.

START-OF-SELECTION.

  SELECT  vbak~vbeln
          vbak~auart
          tvakt~bezei
          vbak~erdat
          vbak~ernam
          vbak~waerk
          tcurt~ltext
    FROM vbak AS vbak
    INNER JOIN tvakt AS tvakt
    ON vbak~auart = tvakt~auart
    INNER JOIN tcurt as tcurt
    on vbak~waerk = tcurt~waers
    INTO TABLE it_vbak
    WHERE vbak~vbeln IN s_vbeln
    AND   vbak~auart IN s_auart
    AND   vbak~erdat IN s_erdat
    AND   vbak~ernam IN s_ernam
    AND   tvakt~spras = sy-langu
    and   tcurt~spras = sy-langu.
BREAK-POINT.