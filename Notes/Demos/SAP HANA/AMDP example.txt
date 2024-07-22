CLASS zamdp_class DEFINITION PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:BEGIN OF ty_ekko,
            ebeln         TYPE ekko-ebeln,
            bukrs         TYPE ekko-bukrs,
            bstyp         TYPE ekko-bstyp,
            bsart         TYPE string,
            creation_date TYPE ekko-aedat,
            creation_day  TYPE char12,
          END OF ty_ekko,


          it_purchase_doc TYPE TABLE OF ty_ekko,

          BEGIN OF ty_ekpo,
            ebeln TYPE ekpo-ebeln,
            ebelp TYPE ekpo-ebelp,
            matnr TYPE ekpo-matnr,
            bukrs TYPE ekpo-bukrs,
            werks TYPE ekpo-werks,
          END OF ty_ekpo,

          it_purchase_item TYPE TABLE OF ty_ekpo.

    INTERFACES if_amdp_marker_hdb.
    METHODS get_purchase_doc
      IMPORTING VALUE(purchase_doc)       TYPE ekko-ebeln
      EXPORTING VALUE(out_purchase_doc)   TYPE it_purchase_doc
                VALUE(out_purchase_items) TYPE it_purchase_item.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zamdp_class IMPLEMENTATION.
  METHOD get_purchase_doc BY DATABASE PROCEDURE
                          FOR HDB
                          LANGUAGE SQLSCRIPT
                          USING ekko
                                ekpo.

    out_purchase_doc = SELECT ebeln,
                              bukrs,
                              bstyp,
                              case
                                when bsart = 'ZSO' then 'Sales Order'
                                when bsart = 'ZEM' then 'Emergency PR'
                                else 'Other Order'
                              end as bsart,
                              aedat as creation_date,
                              DAYNAME ( aedat ) as creation_day
                        FROM EKKO
                        where ebeln = purchase_doc;

    if :purchase_doc = '' then
        return;
    else
        out_purchase_items = select ebeln,
                                    ebelp,
                                    matnr,
                                    bukrs,
                                    werks
                                    from ekpo
                                    where ebeln = purchase_doc;
    end if;

  ENDMETHOD.
ENDCLASS.
====================SE38========================
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
        out_purchase_doc =  DATA(it_purchase_doc)
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