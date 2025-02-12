REPORT  ZZSIVA_06_ACC_DOC_VAL_V3.

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
  END OF ty_bsid,

  BEGIN OF ty_output,
    bukrs   TYPE bukrs,                " Company Code
    gjahr   TYPE gjahr,                " Fiscal Year
    belnr   TYPE belnr_d,              " Document
    wrbtr   TYPE wrbtr,                " Paid
    waers   TYPE waers,                " Currency
    u_wrbtr TYPE wrbtr,                " Unpaid
    u_waers TYPE waers,                " Currency
  END OF ty_output.


DATA:
* work areas
  wa_bkpf   TYPE ty_bkpf,
  wa_bsad   TYPE ty_bsad,
  wa_bsid   TYPE ty_bsid,
  wa_output TYPE ty_output,

* internal tables
  it_bkpf   TYPE STANDARD TABLE OF ty_bkpf,
  it_bsad   TYPE STANDARD TABLE OF ty_bsad,
  it_bsid   TYPE STANDARD TABLE OF ty_bsid,
  it_output TYPE STANDARD TABLE OF ty_output.

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


  LOOP AT it_bkpf INTO wa_bkpf.

   MOVE-CORRESPONDING wa_bkpf TO wa_output.

   READ TABLE it_bsad INTO wa_bsad WITH KEY bukrs = wa_bkpf-bukrs belnr = wa_bkpf-belnr gjahr = wa_bkpf-gjahr.
   IF sy-subrc IS INITIAL.
    MOVE:
     wa_bsad-wrbtr TO wa_output-wrbtr,
     wa_bsad-waers TO wa_output-waers.
   ENDIF.

   READ TABLE it_bsid INTO wa_bsid WITH KEY bukrs = wa_bkpf-bukrs belnr = wa_bkpf-belnr gjahr = wa_bkpf-gjahr.
   IF sy-subrc IS INITIAL.
     MOVE:
     wa_bsid-wrbtr TO wa_output-u_wrbtr,
     wa_bsid-waers TO wa_output-u_waers.
   ENDIF.

* Ignore if the accounting document does not have both paid and unpaid items.
   IF NOT ( wa_output-wrbtr   IS INITIAL AND
            wa_output-u_wrbtr IS INITIAL ).
     APPEND wa_output TO it_output.
   ENDIF.
   CLEAR:
     wa_bkpf,
     wa_bsad,
     wa_bsid,
     wa_output.
  ENDLOOP.

  LOOP AT it_output into wa_output.
    write : / wa_output-bukrs  ,
              wa_output-gjahr  ,
              wa_output-belnr  ,
              wa_output-wrbtr  ,
              wa_output-waers  ,
              wa_output-u_wrbtr,
              wa_output-u_waers.
  ENDLOOP.