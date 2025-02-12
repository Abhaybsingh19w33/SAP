REPORT  zzsiva_07_order_drill_down_v4.

TABLES : vbak,vbap,vbep,kna1.

TYPES : BEGIN OF ty_vbak,
          vbeln TYPE vbeln_va,
          erdat TYPE erdat,
          ernam TYPE ernam,
          kunnr TYPE kunnr,
        END OF ty_vbak,

        BEGIN OF ty_vbep,
          vbeln TYPE vbeln_va,
          posnr TYPE posnr,
          etenr TYPE etenr,
          wmeng TYPE wmeng,
          bmeng TYPE bmeng,
        END OF ty_vbep,

        BEGIN OF ty_kunnr,
          kunnr TYPE kunnr,
          name1 TYPE name1,
        END OF ty_kunnr.


DATA : it_vbak TYPE TABLE OF ty_vbak,
       wa_vbak TYPE ty_vbak,
       it_vbep TYPE TABLE OF ty_vbep,
       wa_vbep TYPE ty_vbep,
       it_kunnr TYPE TABLE OF ty_kunnr,
       wa_kunnr TYPE ty_kunnr.

DATA : BEGIN OF wa_vbap,
        vbeln TYPE vbeln_va,
        posnr TYPE posnr,
        matnr TYPE matnr,
       END OF wa_vbap,

       it_vbap LIKE TABLE OF wa_vbap.

data : fld(20) TYPE C,
       val(10) TYPE C.

SELECT-OPTIONS : s_vbeln FOR vbak-vbeln.

SELECT vbeln
       erdat
       ernam
       kunnr
  FROM vbak
  INTO TABLE it_vbak
  WHERE vbeln IN s_vbeln.

LOOP AT it_vbak INTO wa_vbak.
  WRITE : / wa_vbak-vbeln, wa_vbak-erdat, wa_vbak-ernam, wa_vbak-kunnr.
  HIDE :  wa_vbak-vbeln, wa_vbak-erdat, wa_vbak-ernam, wa_vbak-kunnr.

ENDLOOP.

AT LINE-SELECTION.
  IF sy-lsind = 1.

    GET CURSOR FIELD fld VALUE val.

    IF fld = 'WA_VBAK-VBELN'.
      SELECT vbeln
             posnr
             matnr
        FROM vbap
        INTO TABLE it_vbap
        WHERE vbeln = wa_vbak-vbeln.

      LOOP AT  it_vbap INTO wa_vbap.
        WRITE : / wa_vbap-vbeln, wa_vbap-posnr, wa_vbap-matnr.
      ENDLOOP.
    ENDIF.

    IF fld = 'WA_VBAK-KUNNR'.
      SELECT kunnr
             name1
        FROM kna1
        INTO TABLE it_kunnr
        WHERE kunnr = wa_vbak-kunnr.

      LOOP AT  it_kunnr INTO wa_kunnr.
        WRITE : / wa_kunnr-kunnr, wa_kunnr-name1.
      ENDLOOP.
    ENDIF.

  ENDIF.

TOP-OF-PAGE DURING LINE-SELECTION.

*  if sy-lsind = 1.
*    write : / 'Sales Order Item Report' color 5.
*  endif.
*
*  if sy-lsind = 2.
*    write : / 'Sales Order Schedule line report' COLOR 6.
*  endif.

CASE sy-lsind.
  WHEN 1.
    write : / 'Sales Order Item Report' color 5.
  WHEN 2.
    write : / 'Sales Order Schedule line report' COLOR 6.
  WHEN OTHERS.
ENDCASE.