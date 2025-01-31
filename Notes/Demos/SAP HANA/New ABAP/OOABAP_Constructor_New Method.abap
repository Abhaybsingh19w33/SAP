REPORT Z.
CLASS EMP DEFINITION.
  PUBLIC SECTION.
  METHODS: CONSTRUCTOR IMPORTING
          IM_EMPNO TYPE N
          IM_ENAME TYPE C.

  METHODS DISPEMP.
  PRIVATE SECTION.
  DATA: EMPNO(4)      TYPE N,
        ENAME(10)     TYPE C.
ENDCLASS.

CLASS EMP IMPLEMENTATION.
  METHOD CONSTRUCTOR.
    EMPNO = IM_EMPNO.
    ENAME = IM_ENAME.
  ENDMETHOD.
  METHOD DISPEMP.
      WRITE:/ 'Empno is:' , EMPNO.
      WRITE:/ 'Ename is:' , ENAME.
  ENDMETHOD.
ENDCLASS.
START-OF-SELECTION.
DATA(EMP1)  = NEW  EMP(
          IM_EMPNO = 99
          IM_ENAME  = 'Ram') .
EMP1->DISPEMP( ).

DATA(EMP2)  = NEW  EMP(
         IM_EMPNO = 100
         IM_ENAME = 'Shyam').
CALL METHOD EMP2->DISPEMP.
"CALL METHOD EMP2->DISPEMP( ).
"EMP2->DISPEMP( ).