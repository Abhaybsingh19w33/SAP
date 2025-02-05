REPORT  Z.
CLASS EMPLOYEE DEFINITION.
  PUBLIC SECTION.
    METHODS:
      CONSTRUCTOR
        IMPORTING IM_EMPLOYEE_NO   TYPE I
                  IM_EMPLOYEE_NAME TYPE STRING,
      DISPLAY_ATTRIBUTES.
  PRIVATE SECTION.
    DATA: NO   TYPE I,
          NAME TYPE STRING.
ENDCLASS.
*--- Employee - Implementation
CLASS EMPLOYEE IMPLEMENTATION.
  METHOD  CONSTRUCTOR.
    NO = IM_EMPLOYEE_NO.
    NAME = IM_EMPLOYEE_NAME.
  ENDMETHOD.

  METHOD DISPLAY_ATTRIBUTES.
    WRITE:/ 'Employee', NO, NAME.
  ENDMETHOD.
ENDCLASS.

*******************************************************
CLASS BLUECOLLAR_EMPLOYEE DEFINITION
           INHERITING FROM EMPLOYEE.
  PUBLIC SECTION.
    METHODS:
      CONSTRUCTOR    IMPORTING
                       IM_EMPLOYEE_NO   TYPE I
                       IM_EMPLOYEE_NAME TYPE STRING
                       IM_HOURS         TYPE I,
      DISPLAY_ATTRIBUTES REDEFINITION.
  PRIVATE SECTION.
    DATA HOURS          TYPE I.
ENDCLASS.

*---- CLASS BlueCollar_Employee IMPLEMENTATION
CLASS BLUECOLLAR_EMPLOYEE IMPLEMENTATION.
  METHOD  CONSTRUCTOR.
    SUPER->CONSTRUCTOR( IM_EMPLOYEE_NO = IM_EMPLOYEE_NO
                        IM_EMPLOYEE_NAME = IM_EMPLOYEE_NAME ).
    HOURS = IM_HOURS.
  ENDMETHOD.

  METHOD DISPLAY_ATTRIBUTES.
    SUPER->DISPLAY_ATTRIBUTES( ).
    WRITE HOURS.
  ENDMETHOD.
ENDCLASS.

DATA:
* Object references
O_EMPLOYEE              TYPE REF TO EMPLOYEE,
O_BLUECOLLAR_EMPLOYEE TYPE REF TO BLUECOLLAR_EMPLOYEE.

START-OF-SELECTION.
  CREATE OBJECT O_EMPLOYEE
    EXPORTING
      IM_EMPLOYEE_NO   = 1
      IM_EMPLOYEE_NAME = 'Gylle Karen'.
  CALL METHOD O_EMPLOYEE->DISPLAY_ATTRIBUTES.

* Create bluecollar employee obeject
  CREATE OBJECT O_BLUECOLLAR_EMPLOYEE
    EXPORTING
      IM_EMPLOYEE_NO   = 2
      IM_EMPLOYEE_NAME = 'Tom'
      IM_HOURS         = 5.
  CALL METHOD O_BLUECOLLAR_EMPLOYEE->DISPLAY_ATTRIBUTES.