REPORT z.
CLASS emp DEFINITION.
  PUBLIC SECTION.
    METHODS setemp.
    CLASS-METHODS dispemp.
ENDCLASS.

CLASS emp IMPLEMENTATION.
  METHOD setemp.
    WRITE:  /'This is setemp'.
  ENDMETHOD.
  METHOD dispemp.
    WRITE: / 'This is dispemp'.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA: eobj TYPE REF TO emp.
  CREATE OBJECT eobj.

  CALL METHOD eobj->setemp.
  CALL METHOD emp=>dispemp.