REPORT  ZZSIVA_06_ACC_DOC_VAL_V1.


TABLES:
  bkpf.                                " Accounting document header

TYPES:
  BEGIN OF ty_bkpf,
    bukrs   TYPE bukrs,                " Company Code
    gjahr   TYPE gjahr,                " Fiscal Year
    belnr   TYPE belnr_d,              " Document
  END OF ty_bkpf,

  BEGIN OF ty_bsad,
    bukrs   TYPE bukrs,                " Company Code
    belnr   TYPE belnr_d,              " Document
    gjahr   TYPE gjahr,                " Fiscal Year
    wrbtr   TYPE wrbtr,                " Paid
    waers   TYPE waers,                " Currency
  END OF ty_bsad,

  BEGIN OF ty_bsid,
    bukrs   TYPE bukrs,                " Company Code
    belnr   TYPE belnr_d,              " Document
    gjahr   TYPE gjahr,                " Fiscal Year
    wrbtr   TYPE wrbtr,                " Unpaid
    waers   TYPE waers,                " Currency
  END OF ty_bsid.

DATA:
* work areas
  wa_bkpf   TYPE ty_bkpf,
  wa_bsad   TYPE ty_bsad,
  wa_bsid   TYPE ty_bsid,

* internal tables
  it_bkpf   TYPE STANDARD TABLE OF ty_bkpf,
  it_bsad   TYPE STANDARD TABLE OF ty_bsad,
  it_bsid   TYPE STANDARD TABLE OF ty_bsid.

SELECT-OPTIONS:
  s_bukrs   FOR bkpf-bukrs,            " Company Code
  s_gjahr   FOR bkpf-gjahr,            " Fiscal Year
  s_belnr   FOR bkpf-belnr OBLIGATORY. " Document Number


START-OF-SELECTION.

  SELECT bukrs
         gjahr
         belnr
    FROM bkpf
INTO TABLE it_bkpf
   WHERE belnr IN s_belnr.

  IF NOT it_bkpf[] IS INITIAL.

    SELECT bukrs
           belnr
           gjahr
           wrbtr
           waers
      FROM bsad
INTO TABLE it_bsad
  FOR ALL ENTRIES IN it_bkpf
      WHERE bukrs = it_bkpf-bukrs
        AND belnr = it_bkpf-belnr
        AND gjahr = it_bkpf-gjahr.


    SELECT bukrs
            belnr
            gjahr
            wrbtr
            waers
       FROM bsid
 INTO TABLE it_bsid
   FOR ALL ENTRIES IN it_bkpf
       WHERE bukrs = it_bkpf-bukrs
         AND belnr = it_bkpf-belnr
         AND gjahr = it_bkpf-gjahr.

  ENDIF.

if it_bsid is not INITIAL.
  append LINES OF it_bsid TO it_bsad.
ENDIF.

LOOP AT it_bsad into wa_bsad.
  write : / wa_bsad-bukrs,
            wa_bsad-belnr,
            wa_bsad-gjahr,
            wa_bsad-wrbtr,
            wa_bsad-waers.

ENDLOOP.