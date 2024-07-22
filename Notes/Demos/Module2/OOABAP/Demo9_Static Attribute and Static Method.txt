REPORT  Z.
CLASS EMP DEFINITION.
  PUBLIC SECTION.
    METHODS: SETEMP IMPORTING
                      IM_EMPNO TYPE N
                      IM_ENAME TYPE C.
    METHODS DISPEMP.
    CLASS-METHODS INCR_NO_OF_EMPLOYEES.
    CLASS-METHODS DISP_NO_OF_EMPLOYEES.

  PRIVATE SECTION.
    DATA: EMPNO(4)  TYPE N,
          ENAME(10) TYPE C.

    "DATA NO_OF_EMPLOYEES TYPE I. "Instance attribute
    CLASS-DATA NO_OF_EMPLOYEES TYPE I. "Static attribute
    "Above is a static attribute.
    "Static attributes can be accessed by instance method and static methods also
ENDCLASS.


CLASS EMP IMPLEMENTATION.
  METHOD SETEMP.
    EMPNO = IM_EMPNO.
    ENAME = IM_ENAME.
  ENDMETHOD.

  METHOD INCR_NO_OF_EMPLOYEES.
    NO_OF_EMPLOYEES = NO_OF_EMPLOYEES + 1.
    "static methods CAN access ONLY static attributes
    "EMPNO = 997.
    "static methods CANNOT access instance attributes
  ENDMETHOD.

  METHOD DISP_NO_OF_EMPLOYEES.
    WRITE :/ 'No of Employees is:', NO_OF_EMPLOYEES.
    "static methods CAN access static attributes
  ENDMETHOD.

  METHOD DISPEMP.
    WRITE:/ 'Empno is:' , EMPNO.
    WRITE:/ 'Ename is:' , ENAME.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA EMP1 TYPE REF TO EMP.
  DATA EMP2 TYPE REF TO EMP.

  CREATE OBJECT EMP1.
  CREATE OBJECT EMP2.

  EMP1->SETEMP( IM_EMPNO = 99 IM_ENAME = 'Ram' ).
  EMP=>INCR_NO_OF_EMPLOYEES( ).
  EMP=>DISP_NO_OF_EMPLOYEES( ).
  EMP1->DISPEMP( ).

  CALL METHOD EMP2->SETEMP
    EXPORTING
      IM_EMPNO = 100
      IM_ENAME = 'Shyam'.
  CALL METHOD EMP=>INCR_NO_OF_EMPLOYEES( ).
  EMP=>DISP_NO_OF_EMPLOYEES( ).
  CALL METHOD EMP2->DISPEMP.

  .