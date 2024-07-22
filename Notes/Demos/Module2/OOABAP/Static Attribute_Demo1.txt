"STATIC DATA CAN BE ACCESSED BY INSTANCE METHODS
REPORT  z.
CLASS emp DEFINITION.
  PUBLIC SECTION.
    METHODS: setemp IMPORTING
                      im_empno TYPE n
                      im_ename TYPE c.

    METHODS: dispemp.
  PRIVATE SECTION.
    DATA: empno(4)  TYPE n,
          ename(10) TYPE c.

    "DATA: count_of_employees TYPE i.
    CLASS-DATA: count_of_employees TYPE i.
    "Above is a static attribute.
    "Static attributes can be accessed by 
    "instance method also
    
ENDCLASS.


CLASS emp IMPLEMENTATION.
  METHOD setemp.
    empno = im_empno.
    ename = im_ename.
    count_of_employees = count_of_employees + 1.

  ENDMETHOD.
  METHOD dispemp.
    WRITE:/ 'Empno is:' , empno.
    WRITE:/ 'Ename is:' , ename.
    WRITE :/ 'Count of Employees is:', count_of_employees.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA: emp1 TYPE REF TO emp.
  DATA: emp2 TYPE REF TO emp.

  CREATE OBJECT emp1.
  CREATE OBJECT emp2.

  emp1->setemp( im_empno = 99 im_ename = 'Ram' ).
  emp1->dispemp( ).

  CALL METHOD emp2->setemp
    EXPORTING
      im_empno = 100
      im_ename = 'Shyam'.
  CALL METHOD emp2->dispemp.
  "CALL METHOD EMP2->DISPEMP( ).
  "EMP2->DISPEMP( ).
