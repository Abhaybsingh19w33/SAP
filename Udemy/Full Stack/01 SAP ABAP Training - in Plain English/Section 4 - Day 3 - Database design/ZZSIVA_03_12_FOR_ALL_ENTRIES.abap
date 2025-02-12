*&---------------------------------------------------------------------*
*& Report  ZZSIVA_03_FOR_ALL_ENTRIES
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZZSIVA_03_FOR_ALL_ENTRIES.

PARAMETERS : p_kunnr TYPE kunnr.

TYPES : BEGIN OF ty_kna1,
          kunnr TYPE kunnr,
        END OF ty_kna1,

        BEGIN OF ty_knvv,
          kunnr TYPE kunnr,
          vkorg TYPE vkorg,
          ernam TYPE ernam,
          erdat TYPE erdat,
        END OF ty_knvv.

data : it_kna1 TYPE TABLE OF ty_kna1,
       it_knvv TYPE TABLE OF ty_knvv,
       wa_knvv TYPE ty_knvv.

select kunnr from kna1 into TABLE it_kna1 where kunnr = p_kunnr.

select kunnr vkorg ernam erdat into TABLE it_knvv from knvv FOR ALL ENTRIES IN it_kna1 where kunnr = it_kna1-kunnr.

write : / 'end'.