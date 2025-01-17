REPORT  Z.
CLASS employee DEFINITION.
PUBLIC SECTION.
METHODS:
      constructor
        IMPORTING im_employee_no   TYPE i
                  im_employee_name TYPE string,
      display_attributes.
PRIVATE SECTION.
*--------------------------------------------------------------------
DATA:  no  TYPE i,
       name TYPE string.
ENDCLASS.
*--- Employee - Implementation
CLASS employee IMPLEMENTATION.
METHOD  constructor.
    no = im_employee_no.
    name = im_employee_name.
ENDMETHOD.

METHOD display_attributes.
    WRITE:/ 'Employee', no, name.
ENDMETHOD.
ENDCLASS.

*******************************************************
CLASS bluecollar_employee DEFINITION
           INHERITING FROM employee.
PUBLIC SECTION.
  METHODS:
         constructor   IMPORTING
                  im_employee_no TYPE i
                  im_employee_name TYPE string
                  im_hours TYPE i
                  im_hourly_payment TYPE i,
         display_attributes REDEFINITION,
         display_attributes_blue.

PRIVATE SECTION.
         data : hours          TYPE i,
               hourly_payment TYPE i,
               wage TYPE i.
 ENDCLASS.

*---- CLASS BlueCollar_Employee IMPLEMENTATION


CLASS bluecollar_employee IMPLEMENTATION.
METHOD  constructor .
 super->constructor( im_employee_no = im_employee_no
 im_employee_name = im_employee_name ).
    hours = im_hours.
    hourly_payment = im_hourly_payment.
    wage = hours * hourly_payment.
ENDMETHOD.

METHOD display_attributes.
    super->display_attributes( ).
ENDMETHOD.

METHOD display_attributes_blue.
      WRITE: hours ,hourly_payment , wage.
ENDMETHOD.



ENDCLASS.

CLASS whitecollar_employee DEFINITION
           INHERITING FROM employee.
PUBLIC SECTION.
  METHODS:
         constructor   IMPORTING
                  im_employee_no TYPE i
                  im_employee_name TYPE string
                  im_monthly_salary      TYPE i
                  im_monthly_deductions TYPE i,
                  display_attributes REDEFINITION,
                  display_attributes_white.
PRIVATE SECTION.
         data :  monthly_salary        TYPE i,
                 monthly_deductions    TYPE i,
                 wage TYPE i.

 ENDCLASS.

*---- CLASS WhiteCollar_Employee IMPLEMENTATION


CLASS whitecollar_employee IMPLEMENTATION.
METHOD  constructor .
 super->constructor( im_employee_no = im_employee_no
 im_employee_name = im_employee_name ).
    monthly_salary  = im_monthly_salary.
    monthly_deductions = im_monthly_deductions.
    wage = monthly_salary - monthly_deductions.
ENDMETHOD.

METHOD display_attributes.
    super->display_attributes( ).
ENDMETHOD.

METHOD display_attributes_white.
        WRITE: monthly_salary ,monthly_deductions , wage.
ENDMETHOD.


ENDCLASS.

DATA:
* Object references
 employee1  TYPE REF TO employee,
  o_bluecollar_employee1  TYPE REF TO bluecollar_employee,
  o_whitecollar_employee1  TYPE REF TO whitecollar_employee.

START-OF-SELECTION.
 CREATE OBJECT employee1
      EXPORTING im_employee_no  = 1
                im_employee_name  = 'Gylle Karen'.
 CALL METHOD employee1->display_attributes.

* Create bluecollar employee object
  CREATE OBJECT o_bluecollar_employee1
      EXPORTING im_employee_no  = 2
                im_employee_name  = 'Tom'
                im_hours = 5
                im_hourly_payment = 500.
 CALL METHOD o_bluecollar_employee1->display_attributes.
 CALL METHOD o_bluecollar_employee1->display_attributes_blue.

* Create whitecollar employee obeject
 CREATE OBJECT o_whitecollar_employee1
      EXPORTING im_employee_no = 3
                im_employee_name = 'John Dickens'
                im_monthly_salary = 10000
                im_monthly_deductions = 2500.
 CALL METHOD o_whitecollar_employee1->display_attributes.
 CALL METHOD o_whitecollar_employee1->display_attributes_white.