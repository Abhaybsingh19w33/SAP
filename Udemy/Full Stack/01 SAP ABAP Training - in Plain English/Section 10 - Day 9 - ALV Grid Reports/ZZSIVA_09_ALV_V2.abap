REPORT ZZSIVA_09_ALV_V2 .

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
       wa_ekpo    TYPE ty_ekpo,
       it_fldcat  TYPE SLIS_T_FIELDCAT_ALV,
       wa_fldcat  TYPE SLIS_FIELDCAT_ALV.


select-OPTIONS : s_ebeln for ekpo-ebeln.

START-OF-SELECTION.
  perform fetch_data.
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

  wa_fldcat-fieldname   = 'EBELN'.
  wa_fldcat-tabname     = 'IT_EKPO'.
  wa_fldcat-seltext_m   = 'Purchase Order'.
  append wa_fldcat to it_fldcat.
  clear wa_fldcat.

  wa_fldcat-fieldname   = 'EBELP'.
  wa_fldcat-tabname     = 'IT_EKPO'.
  wa_fldcat-seltext_m   = 'Item'.
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
  append wa_fldcat to it_fldcat.
  clear wa_fldcat.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      IT_FIELDCAT        = it_fldcat
      I_CALLBACK_PROGRAM = sy-repid
    TABLES
      T_OUTTAB           = it_ekpo.

ENDFORM.                    " SHOW_DATA