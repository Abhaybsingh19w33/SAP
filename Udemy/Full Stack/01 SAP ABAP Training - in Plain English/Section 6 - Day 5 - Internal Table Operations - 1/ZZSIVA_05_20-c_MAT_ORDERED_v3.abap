*&---------------------------------------------------------------------*
*& Report  ZZSIVA_05_ORDERS_V1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zzsiva_05_orders_v3.

TABLES:  vbak,  " Order Data
         tvakt, " Order Description text table
         tvzbt, " Payment terms text table
         vbkd,  " Order business data ( like payment terms , customer groups etc )
         t151t. " customer groups text table

*Join of VBAK and VBKD
TYPES : BEGIN OF ty_vbak_vbkd,
          vbeln TYPE vbak-vbeln,
          auart TYPE vbak-auart,
          erdat TYPE vbak-erdat,
          ernam TYPE vbak-ernam,
          kdgrp TYPE vbkd-kdgrp,
          zterm TYPE vbkd-zterm,
        END OF ty_vbak_vbkd,

* Order Type Description from table TVAKT
        BEGIN OF ty_tvakt,
          auart TYPE tvakt-auart,
          bezei TYPE tvakt-bezei,
        END OF ty_tvakt,

* Payment Terms
        BEGIN OF ty_tvzbt,
          zterm TYPE tvzbt-zterm,
          vtext TYPE tvzbt-vtext,
        END OF ty_tvzbt,

*Customer group texts from T151T
        BEGIN OF ty_t151t,
          kdgrp TYPE t151t-kdgrp,
          ktext TYPE t151t-ktext,
        END OF ty_t151t,

*Final structure to be written out on to the screen
        BEGIN OF ty_final,
          vbeln TYPE vbak-vbeln,
          auart TYPE vbak-auart,
          erdat TYPE vbak-erdat,
          ernam TYPE vbak-ernam,
          kdgrp TYPE vbkd-kdgrp,
          zterm TYPE vbkd-zterm,
          bezei TYPE tvakt-bezei,
          vtext TYPE tvzbt-vtext,
          ktext TYPE t151t-ktext,
        END OF ty_final.

*Internal tables
DATA :  it_vbak_vbkd TYPE TABLE OF ty_vbak_vbkd,
        it_tvakt     TYPE TABLE OF ty_tvakt,
        it_tvzbt     TYPE TABLE OF ty_tvzbt,
        it_t151t     TYPE TABLE OF ty_t151t,
        it_final     TYPE TABLE OF ty_final,


        wa_vbak_vbkd TYPE  ty_vbak_vbkd,
        wa_tvakt     TYPE  ty_tvakt,
        wa_tvzbt     TYPE  ty_tvzbt,
        wa_t151t     TYPE  ty_t151t,
        wa_final     TYPE  ty_final.
SELECT-OPTIONS :
  s_vbeln FOR vbak-vbeln,
  s_auart FOR vbak-auart,
  s_erdat FOR vbak-erdat,
  s_ernam FOR vbak-ernam,
  s_zterm FOR vbkd-zterm,
  s_kdgrp FOR vbkd-kdgrp.

START-OF-SELECTION.

  SELECT  vbak~vbeln
          vbak~auart
          vbak~erdat
          vbak~ernam
          vbkd~kdgrp
          vbkd~zterm
    FROM vbak AS vbak
    INNER JOIN vbkd AS vbkd
    ON vbak~vbeln = vbkd~vbeln
    INTO TABLE it_vbak_vbkd
    WHERE vbak~vbeln IN s_vbeln
    AND   vbak~auart IN s_auart
    AND   vbak~erdat IN s_erdat
    AND   vbak~ernam IN s_ernam
    AND   vbkd~posnr = '000000'
    AND   vbkd~zterm IN s_zterm
    AND   vbkd~kdgrp IN s_kdgrp.

  IF it_vbak_vbkd[] IS NOT INITIAL.

    SELECT auart bezei
      FROM tvakt
      INTO TABLE it_tvakt
      FOR ALL ENTRIES IN it_vbak_vbkd
      WHERE auart = it_vbak_vbkd-auart
      AND   spras = sy-langu.

    SELECT zterm vtext
        FROM tvzbt
        INTO TABLE it_tvzbt
        FOR ALL ENTRIES IN it_vbak_vbkd
        WHERE zterm = it_vbak_vbkd-zterm
        AND   spras = sy-langu.

    SELECT kdgrp ktext
        FROM t151t
        INTO TABLE it_t151t
        FOR ALL ENTRIES IN it_vbak_vbkd
        WHERE kdgrp = it_vbak_vbkd-kdgrp
        AND spras = sy-langu.

  ENDIF.

  LOOP AT it_vbak_vbkd INTO wa_vbak_vbkd.
    MOVE-CORRESPONDING wa_vbak_vbkd TO wa_final.

    READ TABLE it_tvakt INTO wa_tvakt WITH KEY auart = wa_vbak_vbkd-auart.
    IF sy-subrc = 0.
      MOVE wa_tvakt-bezei TO wa_final-bezei.
    ENDIF.

    READ TABLE it_tvzbt INTO wa_tvzbt WITH KEY zterm = wa_vbak_vbkd-zterm.
    IF sy-subrc = 0.
      MOVE wa_tvzbt-vtext TO wa_final-vtext.
    ENDIF.

    READ TABLE it_t151t INTO wa_t151t WITH KEY kdgrp = wa_vbak_vbkd-kdgrp.
    IF sy-subrc = 0.
      MOVE wa_t151t-ktext TO wa_final-ktext.
    ENDIF.

    APPEND wa_final TO it_final.
    CLEAR wa_final.
  ENDLOOP.

  BREAK-POINT.