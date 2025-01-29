" The below program will work only of a table has been created in DDIC.
" Participants are suppossed to use their data element names
REPORT Z.
PARAMETERS PEMPNO  TYPE Z104329DEEMPNO. "Data Element
PARAMETERS PEMPNO1 TYPE Z104329EMP-EMPNO.
"Does not show search help if reference
"is made to data element
"observe the field label in both the cases

WRITE PEMPNO.
WRITE PEMPNO1.