REPORT  ZZSIVA_07_ORDER_DRILL_DOWN_V1.

TABLES : vbak,vbap.

types : BEGIN OF ty_vbak,
          vbeln type vbeln_va,
          erdat TYPE erdat,
          ernam TYPE ernam,
        END OF ty_vbak.

data : it_vbak TYPE TABLE OF ty_vbak,
       wa_vbak TYPE ty_vbak.

data : BEGIN OF wa_vbap,
        vbeln TYPE vbeln_va,
        posnr TYPE posnr,
        matnr TYPE matnr,
       END OF wa_vbap,

       it_vbap like TABLE OF wa_vbap.

select-OPTIONS : s_vbeln for vbak-vbeln.

select vbeln
       erdat
       ernam
  FROM vbak
  into TABLE it_vbak
  where vbeln in s_vbeln.

LOOP AT it_vbak INTO wa_vbak.
  write : / wa_vbak-vbeln, wa_vbak-erdat, wa_vbak-ernam.
  hide :  wa_vbak-vbeln, wa_vbak-erdat, wa_vbak-ernam.

ENDLOOP.

at LINE-SELECTION.

  select vbeln
         posnr
         matnr
    from vbap
    into TABLE it_vbap
    where vbeln = wa_vbak-vbeln.

    LOOP AT  it_vbap INTO wa_vbap.
      write : / wa_vbap-vbeln, wa_vbap-posnr, wa_vbap-matnr.
    ENDLOOP.

  BREAK-POINT.