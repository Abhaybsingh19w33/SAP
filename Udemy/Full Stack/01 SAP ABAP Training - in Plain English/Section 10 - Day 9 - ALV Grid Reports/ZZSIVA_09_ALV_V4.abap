REPORT ZZSIVA_09_ALV_V4 .

type-POOLs : slis.

tables : ekpo.

types: BEGIN OF TY_EKPO,
        EBELN TYPE EKPO-EBELN,
        EBELP TYPE EKPO-EBELP,
        MATNR TYPE EKPO-MATNR,
        txz01 TYPE ekpo-TXZ01,
        MENGE TYPE EKPO-MENGE,
        NETPR TYPE EKPO-NETPR,
      END OF TY_EKPO.

data : it_ekpo    type table of ty_ekpo,
       it_sort    TYPE SLIS_T_SORTINFO_ALV,
       wa_ekpo    TYPE ty_ekpo,
       it_fldcat  TYPE SLIS_T_FIELDCAT_ALV,
       wa_fldcat  TYPE SLIS_FIELDCAT_ALV,
       wa_sort    TYPE SLIS_SORTINFO_ALV.


select-OPTIONS : s_ebeln for ekpo-ebeln.

START-OF-SELECTION.
  perform fetch_data.
  perform prepare_fldcat.
  perform show_data.




FORM FETCH_DATA .

  select ebeln
         ebelp
         matnr
         txz01
         menge
         netpr
    from ekpo into table it_ekpo
    where ebeln in s_ebeln.

ENDFORM.                    " FETCH_DATA

FORM SHOW_DATA .

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      IT_FIELDCAT        = it_fldcat
      I_CALLBACK_PROGRAM = sy-repid
      IT_SORT            = it_sort
    TABLES
      T_OUTTAB           = it_ekpo.

ENDFORM.                    " SHOW_DATA


FORM PREPARE_FLDCAT .


  wa_fldcat-fieldname   = 'EBELN'.
  wa_fldcat-tabname     = 'IT_EKPO'.
  wa_fldcat-seltext_m   = 'Purchase Order'.
  wa_fldcat-key         = 'X'.
  append wa_fldcat to it_fldcat.
  clear wa_fldcat.

  wa_fldcat-fieldname   = 'EBELP'.
  wa_fldcat-tabname     = 'IT_EKPO'.
  wa_fldcat-seltext_m   = 'Item'.
  wa_fldcat-key         = 'X'.
  append wa_fldcat to it_fldcat.
  clear wa_fldcat.

  wa_fldcat-fieldname   = 'MATNR'.
  wa_fldcat-tabname     = 'IT_EKPO'.
  wa_fldcat-seltext_m   = 'Material'.
  append wa_fldcat to it_fldcat.
  clear wa_fldcat.

  wa_fldcat-fieldname   = 'TXZ01'.
  wa_fldcat-tabname     = 'IT_EKPO'.
  wa_fldcat-seltext_m   = 'Short Text'.
  append wa_fldcat to it_fldcat.
  clear wa_fldcat.

  wa_fldcat-fieldname   = 'MENGE'.
  wa_fldcat-tabname     = 'IT_EKPO'.
  wa_fldcat-seltext_m   = 'Quantity'.
  append wa_fldcat to it_fldcat.
  clear wa_fldcat.

  wa_fldcat-fieldname   = 'NETPR'.
  wa_fldcat-tabname     = 'IT_EKPO'.
  wa_fldcat-seltext_m   = 'Price'.
  wa_fldcat-do_sum      = 'X'.
  append wa_fldcat to it_fldcat.
  clear wa_fldcat.

**  Set Sorting options.
**  Only sorted fields can be the basis for sub totals.

  wa_sort-fieldname     = 'EBELN'.
  wa_sort-up            = 'X'.
  wa_sort-subtot        = 'X'.
  append wa_sort to it_sort.

ENDFORM.                    " PREPARE_FLDCAT