REPORT  Z.
CLASS EMPLOYEE DEFINITION.
  PUBLIC SECTION.
    METHODS:
      CONSTRUCTOR
        IMPORTING IM_EMPLOYEE_NO   TYPE I
                  IM_EMPLOYEE_NAME TYPE STRING,
      DISPLAY_ATTRIBUTES.
  PRIVATE SECTION.
*--------------------------------------------------------------------
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
      CONSTRUCTOR   IMPORTING
                      IM_EMPLOYEE_NO    TYPE I
                      IM_EMPLOYEE_NAME  TYPE STRING
                      IM_HOURS          TYPE I
                      IM_HOURLY_PAYMENT TYPE I,
      DISPLAY_ATTRIBUTES REDEFINITION.
  PRIVATE SECTION.
    DATA : HOURS          TYPE I,
           HOURLY_PAYMENT TYPE I,
           WAGE           TYPE I.
ENDCLASS.

*---- CLASS BlueCollar_Employee IMPLEMENTATION


CLASS BLUECOLLAR_EMPLOYEE IMPLEMENTATION.
  METHOD  CONSTRUCTOR .
    SUPER->CONSTRUCTOR( IM_EMPLOYEE_NO = IM_EMPLOYEE_NO
    IM_EMPLOYEE_NAME = IM_EMPLOYEE_NAME ).
    HOURS = IM_HOURS.
    HOURLY_PAYMENT = IM_HOURLY_PAYMENT.
    WAGE = HOURS * HOURLY_PAYMENT.
  ENDMETHOD.

  METHOD DISPLAY_ATTRIBUTES.
    SUPER->DISPLAY_ATTRIBUTES( ).
    WRITE: HOURS ,HOURLY_PAYMENT , WAGE.
  ENDMETHOD.
ENDCLASS.

CLASS WHITECOLLAR_EMPLOYEE DEFINITION
           INHERITING FROM EMPLOYEE.
  PUBLIC SECTION.
    METHODS:
      CONSTRUCTOR   IMPORTING
                      IM_EMPLOYEE_NO        TYPE I
                      IM_EMPLOYEE_NAME      TYPE STRING
                      IM_MONTHLY_SALARY     TYPE I
                      IM_MONTHLY_DEDUCTIONS TYPE I,
      DISPLAY_ATTRIBUTES REDEFINITION.
  PRIVATE SECTION.
    DATA : MONTHLY_SALARY     TYPE I,
           MONTHLY_DEDUCTIONS TYPE I,
           SALARY             TYPE I.

ENDCLASS.

*---- CLASS WhiteCollar_Employee IMPLEMENTATION


CLASS WHITECOLLAR_EMPLOYEE IMPLEMENTATION.
  METHOD  CONSTRUCTOR .
    SUPER->CONSTRUCTOR( IM_EMPLOYEE_NO = IM_EMPLOYEE_NO
    IM_EMPLOYEE_NAME = IM_EMPLOYEE_NAME ).
    MONTHLY_SALARY  = IM_MONTHLY_SALARY.
    MONTHLY_DEDUCTIONS = IM_MONTHLY_DEDUCTIONS.
    SALARY = MONTHLY_SALARY - MONTHLY_DEDUCTIONS.
  ENDMETHOD.

  METHOD DISPLAY_ATTRIBUTES.
    SUPER->DISPLAY_ATTRIBUTES( ).
    WRITE: MONTHLY_SALARY ,MONTHLY_DEDUCTIONS , SALARY.
  ENDMETHOD.
ENDCLASS.

DATA:
* Object references
  EMPLOYEE1               TYPE REF TO EMPLOYEE,
  O_BLUECOLLAR_EMPLOYEE1  TYPE REF TO BLUECOLLAR_EMPLOYEE,
  O_WHITECOLLAR_EMPLOYEE1 TYPE REF TO WHITECOLLAR_EMPLOYEE.

START-OF-SELECTION.
  CREATE OBJECT EMPLOYEE1
    EXPORTING
      IM_EMPLOYEE_NO   = 1
      IM_EMPLOYEE_NAME = 'Gylle Karen'.
  CALL METHOD EMPLOYEE1->DISPLAY_ATTRIBUTES.

* Create bluecollar employee object
  CREATE OBJECT O_BLUECOLLAR_EMPLOYEE1
    EXPORTING
      IM_EMPLOYEE_NO    = 2
      IM_EMPLOYEE_NAME  = 'Tom'
      IM_HOURS          = 5
      IM_HOURLY_PAYMENT = 500.
  CALL METHOD O_BLUECOLLAR_EMPLOYEE1->DISPLAY_ATTRIBUTES.

* Create whitecollar employee obeject
  CREATE OBJECT O_WHITECOLLAR_EMPLOYEE1
    EXPORTING
      IM_EMPLOYEE_NO        = 3
      IM_EMPLOYEE_NAME      = 'John Dickens'
      IM_MONTHLY_SALARY     = 10000
      IM_MONTHLY_DEDUCTIONS = 2500.
  CALL METHOD O_WHITECOLLAR_EMPLOYEE1->DISPLAY_ATTRIBUTES.