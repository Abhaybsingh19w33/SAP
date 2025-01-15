REPORT  Z.
"Old Method
*DATA lv_string type string.
*lv_string = 'ABAPGurus SAP ABAP Tutorial'.

"New Method
DATA(lv_string) = 'ABAPGurus SAP ABAP Tutorial'.
WRITE lv_string.