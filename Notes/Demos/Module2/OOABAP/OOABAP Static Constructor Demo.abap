REPORT  ZVKCLASSA1.
*Class with constructor
CLASS employee DEFINITION.
PUBLIC SECTION.
    CLASS-METHODS:
      class_constructor.
*        IMPORTING im_employee_no TYPE i
*                  im_employee_name TYPE string,
      METHODs display_employee.
PRIVATE SECTION.
*--------------------------------------------------------------------
CLASS-DATA:  no  TYPE i,
       name TYPE string.

ENDCLASS.
*--- Employee - Implementation
CLASS employee IMPLEMENTATION.
  METHOD  class_constructor.
    no = 10.
    name = 'Ram'.
  ENDMETHOD.

  METHOD display_employee.
    WRITE:/ 'Employee:', no, name.
  ENDMETHOD.
ENDCLASS.
************************************************************************
DATA: g_employee1 TYPE REF TO employee.

START-OF-SELECTION.
  CREATE OBJECT g_employee1.

  CALL METHOD g_employee1->display_employee( ).