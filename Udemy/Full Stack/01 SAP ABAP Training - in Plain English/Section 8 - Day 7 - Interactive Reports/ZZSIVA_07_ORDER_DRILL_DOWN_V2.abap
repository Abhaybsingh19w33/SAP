REPORT  zzsiva_07_order_drill_down_v2.

TABLES : vbak,vbap,vbep.

TYPES : BEGIN OF ty_vbak,
          vbeln TYPE vbeln_va,
          erdat TYPE erdat,
          ernam TYPE ernam,
        END OF ty_vbak,

        BEGIN OF ty_vbep,
          vbeln TYPE vbeln_va,
          posnr TYPE posnr,
          etenr TYPE etenr,
          wmeng TYPE wmeng,
          bmeng TYPE bmeng,
        END OF ty_vbep.


DATA : it_vbak TYPE TABLE OF ty_vbak,
       wa_vbak TYPE ty_vbak,
       it_vbep TYPE TABLE OF ty_vbep,
       wa_vbep TYPE ty_vbep.

DATA : BEGIN OF wa_vbap,
        vbeln TYPE vbeln_va,
        posnr TYPE posnr,
        matnr TYPE matnr,
       END OF wa_vbap,

       it_vbap LIKE TABLE OF wa_vbap.

SELECT-OPTIONS : s_vbeln FOR vbak-vbeln.

SELECT vbeln
       erdat
       ernam
  FROM vbak
  INTO TABLE it_vbak
  WHERE vbeln IN s_vbeln.

LOOP AT it_vbak INTO wa_vbak.
  WRITE : / wa_vbak-vbeln, wa_vbak-erdat, wa_vbak-ernam.
  HIDE :  wa_vbak-vbeln, wa_vbak-erdat, wa_vbak-ernam.

ENDLOOP.

AT LINE-SELECTION.
  IF sy-lsind = 1.
    SELECT vbeln
           posnr
           matnr
      FROM vbap
      INTO TABLE it_vbap
      WHERE vbeln = wa_vbak-vbeln.

    LOOP AT  it_vbap INTO wa_vbap.
      WRITE : / wa_vbap-vbeln, wa_vbap-posnr, wa_vbap-matnr.
      HIDE :  wa_vbap-vbeln, wa_vbap-posnr, wa_vbap-matnr.
    ENDLOOP.
  ENDIF.

  IF sy-lsind = 2.
    SELECT vbeln
           posnr
           etenr
           wmeng
           bmeng
      FROM vbep
      INTO TABLE it_vbep
      WHERE vbeln = wa_vbap-vbeln
      AND   posnr = wa_vbap-posnr.

    LOOP AT it_vbep INTO wa_vbep.
      WRITE : / wa_vbep-vbeln, wa_vbep-posnr, wa_vbep-etenr, wa_vbep-wmeng, wa_vbep-bmeng.
    ENDLOOP.

  ENDIF.
  BREAK-POINT.