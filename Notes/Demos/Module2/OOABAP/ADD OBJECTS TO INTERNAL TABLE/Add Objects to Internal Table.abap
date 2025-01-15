REPORT  z.
CLASS emp DEFINITION.
  PUBLIC SECTION.
    METHODS setemp IMPORTING
                      im_empno TYPE n
                      im_ename TYPE c.

    METHODS dispemp.
  PRIVATE SECTION.
    DATA: empno(4)  TYPE n,
          ename(10) TYPE c.
ENDCLASS.

CLASS emp IMPLEMENTATION.
  METHOD setemp.
    empno = im_empno.
    ename = im_ename.
  ENDMETHOD.
  METHOD dispemp.
    WRITE:/ 'Empno is:' , empno.
    WRITE:/ 'Ename is:' , ename.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA emp1 TYPE REF TO emp.
  DATA emp2 TYPE REF TO emp.
  DATA emp_det TYPE TABLE OF REF TO emp.

  CREATE OBJECT emp1.
  emp1->setemp( im_empno = 99 im_ename = 'Ram' ).
  APPEND emp1 TO emp_det.

  CREATE OBJECT emp2.
  CALL METHOD emp2->setemp
    EXPORTING
      im_empno = 100
      im_ename = 'Shyam'.
  APPEND emp2 TO emp_det.

  LOOP AT emp_det INTO emp1.
    emp1->dispemp( ).
  ENDLOOP.