REPORT  ZVK1.
*Example of standard table
*APPEND AND INSERT IN STANDARD TABLE
DATA: itdept1 like STANDARD TABLE OF z104329dept
      WITH NON-UNIQUE DEFAULT KEY
      INITIAL SIZE 0.
DATA: wa1 LIKE z104329dept.

DATA: itdept2 like STANDARD TABLE OF z104329dept
      WITH NON-UNIQUE DEFAULT KEY
      INITIAL SIZE 0.

perform selecttab.
*PERFORM DISP.

*perform INSERT.
*PERFORM DISP.

perform APPEND.
PERFORM DISP.

form selecttab.
      select * from z104329dept into table itdept1.
ENDFORM.


FORM insert.
      wa1-deptno = 11.
      wa1-dname  = '11'.
      wa1-loc    ='11'.

*insert wa1 into TABLE itdept1.
* record 11 is APPENDED AT LAST.
*NO INDEX CAN BE SPECIFIED HERE

*insert INITIAL LINE into table itdept1.
*if u specify insert inital line 
*a blank line is inserted at last.
*NO INDEX CAN BE SPECIFIED HERE

*perform addtoitdept2.
*insert lines of itdept2 from 2 to 4
*into TABLE itdept1.
*66, 77 and 88 are inserted AT LAST
*NO INDEX CAN BE SPECIFIED HERE

*insert wa1 into itdept1 INDEX 2.
* record 11 is inserted at index 2

*insert INITIAL LINE into itdept1 INDEX 2.
*if u specify insert inital line a blank line is inserted at index 2

      perform addtoitdept2.
      insert lines of itdept2 from 2 to 4
      into itdept1 index 2.
*66, 77 and 88 are inserted from index 2
ENDFORM.

form append.
*APPEND INITIAL LINE TO itdept1.
*if u specify APPEND inital line a blank line
*is inserted at the last
      perform addtoitdept2.
      APPEND LINES OF itdept2 from 2 to 4 to itdept1.
*66, 77 and 88 are APPENDED AT LAST
ENDFORM.

FORM DISP.
      loop at itdept1 INTO wa1.
            write :/ wa1-deptno.
            write :  wa1-dname.
            write :  wa1-loc.
      endloop.
ENDFORM.

form addtoitdept2.
      wa1-deptno = 55.
      wa1-dname  = '55'.
      wa1-loc    ='55'.
      append wa1 to itdept2.

      wa1-deptno = 66.
      wa1-dname  = '66'.
      wa1-loc    ='66'.
      append wa1 to itdept2.

      wa1-deptno = 77.
      wa1-dname  = '77'.
      wa1-loc    ='77'.
      append wa1 to itdept2.

      wa1-deptno = 88.
      wa1-dname  = '88'.
      wa1-loc    ='88'.
      append wa1 to itdept2.

      wa1-deptno = 99.
      wa1-dname  = '99'.
      wa1-loc    ='99'.
      append wa1 to itdept2.
ENDFORM.