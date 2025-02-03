*&---------------------------------------------------------------------*
*& Report ZADM_COLLECT_ITAB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZRTC_COLLECT_ITAB.

TYPES : BEGIN OF ty_sales,
          kunnr type kunnr,
          sales type i,
        end  of ty_sales.
data : wa type ty_sales,
       itab type TABLE OF ty_sales.

clear wa.
wa-kunnr = '1000'.
wa-sales = 1000.
COLLECT wa into itab.

clear wa.
wa-kunnr = '2000'.
wa-sales = 2000.
COLLECT wa into itab.

clear wa.
wa-kunnr = '1000'.
wa-sales = 3000.
COLLECT wa into itab.



LOOP AT itab into wa.
      write : / wa-kunnr COLOR 1,
                wa-sales COLOR 2.
ENDLOOP.