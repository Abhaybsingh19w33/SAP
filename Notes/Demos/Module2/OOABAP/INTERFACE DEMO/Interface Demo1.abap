REPORT  Z.
INTERFACE LIF_EMPLOYEE.
  METHODS SET_ATTRIBUTES.
ENDINTERFACE.

CLASS EMPLOYEE DEFINITION.
  PUBLIC SECTION.
    INTERFACES LIF_EMPLOYEE.
    METHODS DISPLAY_ATTRIBUTES.
ENDCLASS.
*-- CLASS LCL_CompanyEmployees IMPLEMENTATION

CLASS EMPLOYEE IMPLEMENTATION.
  METHOD LIF_EMPLOYEE~SET_ATTRIBUTES.
    WRITE /'Set attribute is called'.
  ENDMETHOD.
  METHOD DISPLAY_ATTRIBUTES.
    WRITE /'Display attribute is called'.
  ENDMETHOD.
ENDCLASS.

DATA EMPLOYEE1  TYPE REF TO EMPLOYEE.
START-OF-SELECTION.
* Create employee object
  CREATE OBJECT EMPLOYEE1.
  CALL METHOD EMPLOYEE1->LIF_EMPLOYEE~SET_ATTRIBUTES."Call method of Interface
  CALL METHOD EMPLOYEE1->DISPLAY_ATTRIBUTES."Call method of class