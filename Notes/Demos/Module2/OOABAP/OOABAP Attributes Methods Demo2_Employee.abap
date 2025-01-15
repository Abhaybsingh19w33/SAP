REPORT  z.
CLASS employee DEFINITION.
  PUBLIC SECTION.
    METHODS:
      set_attributes
        IMPORTING im_employee_no   TYPE i
                  im_employee_name TYPE string,
      display_employee.
  PRIVATE SECTION.
*--------------------------------------------------------------------
    DATA: no   TYPE i,
          name TYPE string.

ENDCLASS.
*--- Employee - Implementation
CLASS employee IMPLEMENTATION.
  METHOD  set_attributes.
    no = im_employee_no.
    name = im_employee_name.
  ENDMETHOD.

  METHOD display_employee.
    WRITE:/ 'Employee', no, name.
  ENDMETHOD.
ENDCLASS.
************************************************************************
DATA: g_employee1 TYPE REF TO employee,
      g_employee2 TYPE REF TO employee.

START-OF-SELECTION.
  CREATE OBJECT g_employee1.
  CALL METHOD g_employee1->set_attributes
    EXPORTING
      im_employee_no   = 1
      im_employee_name = 'John Jones'.
  CREATE OBJECT g_employee2.
  CALL METHOD g_employee2->set_attributes
    EXPORTING
      im_employee_no   = 2
      im_employee_name = 'Sally Summer'.
  CALL METHOD g_employee1->display_employee.
  CALL METHOD g_employee2->display_employee.