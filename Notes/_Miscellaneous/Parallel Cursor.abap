" How to increase performance using Parallel Cursor in SAP ABAP ?

" The first thing that comes into the mind of a good ABAPer is performance of his object, the main problem for performance issues are bad Select statements ex: select joins for more than 3 tables, nested Loops, how ever there is a concept of parallel cursor in SAP ABAP to avoid performance issues with nested loops with where condition.

" Parallel cursor is the technique to increase the performance of the program, when there are nested loops.  

" For example if we use nested select in our program instead of For all entries addition, then definitely performance going down. In the same way the if we use nested loops in the program it will also leads to down the performance.

" For example:
" if the code contains this type of logic:
" loop at itab into wa.
    " loop at itab1 into wa1.
    " endloop.
" endloop.

" In the above logic, for one record of the itab, again the table itab1 loops many times. If itab contains many records and also at the same time if itab1 contains double the records, then this would result into performance issue.

" You can modify it as:
" loop at itab into wa.
"     read table itab1 into wa1 with key field1 = wa-field1.
"     v_tabix = sy-tabix.
"     if sy-subrc eq 0.
"         loop at itab1 into wa1 from v_tabix. "It will loop from that index
"         endloop.
"     endif.
" endloop.

" Parallel Cursor in ABAP.
Program without parallel cursor
REPORT  ztemp_test.

TYPES: BEGIN OF ty_but000,
         partner  TYPE bu_partner,
         bpkind   TYPE bu_bpkind,
         bu_group TYPE bu_group,
         bpext    TYPE bu_bpext,
         augrp    TYPE bu_augrp,
       END OF ty_but000.

DATA : it_but000 TYPE TABLE OF ty_but000,
       wa_but000 TYPE ty_but000.

TYPES: BEGIN OF ty_but050,
         relnr    TYPE bu_relnr,
         partner2 TYPE bu_partner,
         date_to  TYPE bu_datto,
       END OF ty_but050.

DATA : it_but050 TYPE TABLE OF ty_but050,
       wa_but050 TYPE ty_but050.

SELECT
      partner
      bpkind
      bu_group
      bpext
      augrp
      FROM but000
      INTO TABLE it_but000 UP TO 100 ROWS.
IF sy-subrc IS INITIAL.
  SORT it_but000.
ENDIF.

DELETE ADJACENT DUPLICATES FROM it_but000 COMPARING ALL FIELDS.

SELECT
      relnr
      partner2
      date_to
      FROM but050
      INTO TABLE it_but050
      FOR ALL ENTRIES IN it_but000
      WHERE partner2 = it_but000-partner.
  IF sy-subrc IS INITIAL.
    SORT it_but050.
  ENDIF.

LOOP AT it_but000 INTO wa_but000.
  LOOP AT it_but050 INTO wa_but050 WHERE partner2 = wa_but000-partner.
    WRITE:/ wa_but050-relnr, wa_but050-partner2, wa_but050-date_to.
  ENDLOOP.
ENDLOOP.


Program with parallel cursor..
REPORT znew.

TYPES: BEGIN OF ty_but000,
         partner  TYPE bu_partner,
         bpkind   TYPE bu_bpkind,
         bu_group TYPE bu_group,
         bpext    TYPE bu_bpext,
         augrp    TYPE bu_augrp,
       END OF ty_but000.

DATA : it_but000 TYPE TABLE OF ty_but000,
             wa_but000 TYPE ty_but000.

TYPES: BEGIN OF ty_but050,
         relnr    TYPE bu_relnr,
         partner2 TYPE bu_partner,
         date_to  TYPE bu_datto,
       END OF ty_but050.

DATA : it_but050 TYPE TABLE OF ty_but050,
             wa_but050 TYPE ty_but050.

SELECT
      partner
      bpkind
      bu_group
      bpext
      augrp
      FROM but000
      INTO TABLE it_but000 UP TO 100 ROWS.
IF sy-subrc IS INITIAL.
  SORT it_but000 BY partner.
ENDIF.

DELETE ADJACENT DUPLICATES FROM it_but000 COMPARING ALL FIELDS.

SELECT
      relnr
      partner2
      date_to
      FROM but050
      INTO TABLE it_but050
      FOR ALL ENTRIES IN it_but000
      WHERE partner2 = it_but000-partner.
IF sy-subrc IS INITIAL.
  SORT it_but050 BY partner2.
ENDIF.

DATA : lv_index TYPE sy-tabix.

LOOP AT it_but000 INTO wa_but000.
READ TABLE it_but050 INTO wa_but050 WITH KEY partner2 = wa_but000- partner BINARY SEARH.
  IF sy-subrc IS INITIAL.
    lv_index = sy-tabix.

    LOOP AT it_but050 INTO wa_but050 FROM lv_index.
      IF wa_but050-partner2 NE wa_but000-partner .
        EXIT.
      ENDIF.

      WRITE:/ wa_but050-relnr, wa_but050-partner2, wa_but050-date_to.
    ENDLOOP.
  ENDIF.
ENDLOOP.