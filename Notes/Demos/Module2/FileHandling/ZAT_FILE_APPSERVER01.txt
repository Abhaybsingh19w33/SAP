REPORT ZAT_FILE_APPSERVER01.
DATA : BEGIN OF it_tab OCCURS 0,
         matnr(18),
         mbrsh(1),
         mtart(4),
         maktx(40),
         meins(3),
         matkl(9),
       END OF it_tab.

START-OF-SELECTION.
  DATA p_file1 TYPE string.
  p_file1 = '\\ndafile\Study Materials\SAP ABAP\AT_Notes\Demos in Sequence\File Handling\materials.txt'.
"
  CALL FUNCTION 'GUI_UPLOAD'
    EXPORTING
      filename            = p_file1
"     filetype            = 'ASC'
      has_field_separator = 'X'
    TABLES
      data_tab            = it_tab.

  WRITE: 'SY-SUBRC IS:', sy-subrc.
SKIP 1.
*  LOOP AT it_tab.
*    WRITE / it_tab-matnr.
*    WRITE it_tab-mbrsh.
*    WRITE it_tab-mtart.
*    WRITE it_tab-maktx.
*    WRITE it_tab-meins.
*    WRITE it_tab-matkl.
*  ENDLOOP.
"AAAAKFILE10
  IF sy-subrc <> 0.
* Implement suit_table error handling here
  ENDIF.
  OPEN DATASET 'AAAAKFILE10' FOR OUTPUT IN TEXT  MODE ENCODING DEFAULT.
  LOOP AT it_tab.
    TRANSFER it_tab TO 'AAAAKFILE10'.
    CLEAR it_tab.
  ENDLOOP.
  CLOSE DATASET 'AAAAKFILE10'.