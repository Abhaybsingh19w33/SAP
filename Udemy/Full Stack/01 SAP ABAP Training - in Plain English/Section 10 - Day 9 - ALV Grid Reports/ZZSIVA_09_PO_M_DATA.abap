*&---------------------------------------------------------------------*
*&  Include           ZZSIVA_09_PO_M_DATA
*&---------------------------------------------------------------------*
TYPE-POOLS : slis .

TABLES : ekko, ekpo, zzsiva_po_m.

TYPES: BEGIN OF ty_po,
        ebeln TYPE zzsiva_po_m-ebeln,
        ebelp TYPE zzsiva_po_m-ebelp,
        txz01 TYPE zzsiva_po_m-txz01,
        matnr TYPE zzsiva_po_m-matnr,
        menge TYPE zzsiva_po_m-menge,
        meins TYPE zzsiva_po_m-meins,
        netpr TYPE zzsiva_po_m-netpr,
        peinh TYPE zzsiva_po_m-peinh,
        team TYPE zzsiva_po_m-team,
        status TYPE zzsiva_po_m-status,
        box   TYPE c,
      END OF ty_po.

DATA  :  it_po TYPE TABLE OF ty_po,
         wa_po TYPE ty_po.

**Field Catalog
DATA  :  it_fldcat TYPE slis_t_fieldcat_alv,
         wa_fldcat TYPE slis_fieldcat_alv.

DATA  : it_events TYPE slis_t_event,
        wa_events TYPE slis_alv_event.

*Layout
DATA  : wa_layout TYPE slis_layout_alv.