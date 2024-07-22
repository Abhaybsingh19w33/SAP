REPORT  z.
CLASS emp DEFINITION.
  PUBLIC SECTION.
    METHODS: setemp IMPORTING
                      im_empno TYPE n
                      im_ename TYPE c.
    METHODS: dispemp.
    CLASS-METHODS incr_no_of_employees.
    CLASS-METHODS disp_no_of_employees.

  PRIVATE SECTION.
    DATA: empno(4)  TYPE n,
          ename(10) TYPE c.

    "DATA: count_of_employees TYPE i.
    CLASS-DATA: count_of_employees TYPE i.
    "Above is a static attribute.
    "Static attributes can be accessed
    "by instance method ALSO
ENDCLASS.


CLASS emp IMPLEMENTATION.
  METHOD setemp.
    empno = im_empno.
    ename = im_ename.
  ENDMETHOD.

  METHOD incr_no_of_employees.
    count_of_employees = count_of_employees + 1.
    "static methods cannot access instance attributes
    "static methods can access only static attributes
  ENDMETHOD.

  METHOD disp_no_of_employees.
    WRITE :/ 'Count of Employees is:', count_of_employees.
  ENDMETHOD.

  METHOD dispemp.
    WRITE:/ 'Empno is:' , empno.
    WRITE:/ 'Ename is:' , ename.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA: emp1 TYPE REF TO emp.
  DATA: emp2 TYPE REF TO emp.

  CREATE OBJECT emp1.
  CREATE OBJECT emp2.

  emp1->setemp( im_empno = 99 im_ename = 'Ram' ).
  emp=>incr_no_of_employees( ).
  emp1->dispemp( ).
  emp=>disp_no_of_employees( ).

  CALL METHOD emp2->setemp
    EXPORTING
      im_empno = 100
      im_ename = 'Shyam'.
  emp=>incr_no_of_employees( ).

  "CALL METHOD emp=>incr_no_of_employees( ).

  CALL METHOD emp2->dispemp.
  emp2->disp_no_of_employees( ).
  "emp=>disp_no_of_employees( ).