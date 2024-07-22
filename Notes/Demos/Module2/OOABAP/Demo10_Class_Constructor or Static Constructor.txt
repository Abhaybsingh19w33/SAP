REPORT  z.
CLASS emp DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS:
      class_constructor.
    "CLASS_CONSTRUTOR CANNOT HAVE PARAMETERS

    METHODS: dispemp.
  PRIVATE SECTION.
    CLASS-DATA: empno(4)  TYPE n,
                ename(10) TYPE c.
ENDCLASS.

CLASS emp IMPLEMENTATION.
  METHOD class_constructor.
    empno = 100.
    ename = 'Ram'.
    WRITE : 'Constructor is called'.
  ENDMETHOD.
  METHOD dispemp.
    WRITE:/ 'Empno is:' , empno.
    WRITE:/ 'Ename is:' , ename.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA: emp1 TYPE REF TO emp.
  CREATE OBJECT emp1.
emp1->dispemp( ).