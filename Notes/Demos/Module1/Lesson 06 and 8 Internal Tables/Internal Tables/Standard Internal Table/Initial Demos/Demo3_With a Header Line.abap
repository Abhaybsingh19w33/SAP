*Note: It is not recommended to create internal tables with header line
*This method is obsolete
*ITAB is the name of internal table.
*ITAB is also the name of header line/work area.
*Header line and work area serve the same purpose.
*They hold a record of Internal Table.
*If Internal table is declared with header line,
*the name of internal table and header line is the same.
*There is no need to create explicit work area.
DATA ITAB TYPE TABLE OF I WITH HEADER LINE.

ITAB = 10. "Header line
APPEND ITAB TO ITAB. "APPEND HEADER LINE TO INTERNAL TABLE
ITAB = 20.
APPEND ITAB. "IMPLIES APPEND ITAB TO ITAB
ITAB = 30.
APPEND ITAB. "IMPLIES APPEND ITAB TO ITAB
ITAB = 40.
APPEND ITAB. "IMPLIES APPEND ITAB TO ITAB
ITAB = 50.
APPEND ITAB. "IMPLIES APPEND ITAB TO ITAB

LOOP AT ITAB. "IMPLIES LOOP AT ITAB INTO ITAB
  WRITE ITAB.
ENDLOOP.