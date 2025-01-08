*&---------------------------------------------------------------------*
*& Report zamdp_example
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zamdp_example.

PARAMETERS : p_ebeln TYPE ekko-ebeln.

DATA(o_amdp) = NEW zamdp_class( ).

o_amdp->get_purchase_doc(
    EXPORTING
        purchase_doc = p_ebeln
    IMPORTING
        out_purchase_doc = DATA(it_purchase_doc)
        out_purchase_items = DATA(it_purchase_items)
).

*cl_demo_output=>display( it_purchase_doc ).
LOOP AT it_purchase_doc INTO DATA(ls_purchase_doc).
  WRITE : / ls_purchase_doc-ebeln,
            ls_purchase_doc-bukrs,
            ls_purchase_doc-bstyp,
            ls_purchase_doc-bsart,
            ls_purchase_doc-creation_date,
            ls_purchase_doc-creation_day.
ENDLOOP.

LOOP AT it_purchase_items INTO DATA(ls_purchase_item).
  WRITE : / ls_purchase_item-ebeln,
            ls_purchase_item-ebelp,
            ls_purchase_item-matnr,
            ls_purchase_item-bukrs,
            ls_purchase_item-werks.
ENDLOOP.