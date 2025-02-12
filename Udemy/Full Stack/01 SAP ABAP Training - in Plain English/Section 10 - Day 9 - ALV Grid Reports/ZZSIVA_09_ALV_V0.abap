REPORT  ZZSIVA_09_ALV_V0.

tables : ekpo.

select-OPTIONS :
    s_ebeln     FOR ekpo-ebeln.


data : it_ekpo TYPE TABLE OF ekpo,
       wa_ekpo TYPE ekpo.


select * from ekpo into TABLE it_ekpo where ebeln in s_ebeln.

*LOOP AT it_ekpo into wa_ekpo.
*  write : / wa_ekpo-ebeln, wa_ekpo-ebelp.
*ENDLOOP.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING
    I_CALLBACK_PROGRAM                = sy-repid
    I_STRUCTURE_NAME                  = 'EKPO'
  TABLES
    T_OUTTAB                          = it_ekpo.
          .