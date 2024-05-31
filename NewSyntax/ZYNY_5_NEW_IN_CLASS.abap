*&---------------------------------------------------------------------*
*& Report ZYNY_5_NEW_IN_CLASS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zyny_5_new_in_class.

*Link - https://discoveringabap.com/2021/09/23/abap-7-4-and-beyond-5-new-in-class/#google_vignette

*In this post, you will learn about the New keyword, creating objects
*and calling methods the 7.40 way.

*If you are still using CREATE OBJECT and TYPE REF TO always to declare
*and create objects then you are living in the past. Take a look at
*what is possible now with the objects.

*NEW Operator

*Suppose you want to create an object for a class ZCL_ABAP, below is
*the syntax.

data(lo_abap) = new zcl_abap( ).    "New way
*This is similar to below piece of code.

DATA lo_abap1 TYPE REF TO lcl_abap.  "Old way
CREATE OBJECT lo_abap1.
*When you have a constructor for the class, you can pass the values
*within the ( ).

*Suppose, you have below class definition and implementation.

CLASS lcl_abap DEFINITION.
  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING iv_user        TYPE sy-uname,
      get_name    RETURNING VALUE(rv_name) TYPE char40.
  PRIVATE SECTION.
    DATA gv_user TYPE sy-uname.
ENDCLASS.

CLASS lcl_abap IMPLEMENTATION.
  METHOD constructor.
    gv_user = iv_user.
  ENDMETHOD.
  METHOD get_name.
    rv_name = 'Jagdish P'.   "This can be a query as well
  ENDMETHOD.
ENDCLASS.
*You can create the object as below and use it to call the method.

DATA(lo_abap) = NEW lcl_abap( 'JAGDISHP' ).
DATA(lv_name) = lo_abap->get_name( ).
*Here, there is only one Importing parameter for the constructor, so a
*value can be passed without parameter name. When there are multiple
*parameters in the constructor or the method, we need to specify the
*name in the call.

DATA(lo_abap) = NEW lcl_abap( iv_user = 'JAGDISHP'
                              iv_type = 'Dialog' ). "only for demo
*For reference, below is the old way to do the same thing

DATA lo_abap1 TYPE REF TO lcl_abap.

CREATE OBJECT lo_abap1
  EXPORTING
    iv_user = 'JAGDISHP'.

CALL METHOD lo_abap->get_name
  RECEIVING
    rv_name = lv_name.

*Method Chaining

*Method chaining is not a something that ABAP 7.40 brought in but it is
*more effective with ABAP 7.40.

*Method chaining is not like the chain statement that we use for
*declaring data with symbol colon [ : ]. It is a way in which you can
*call a method which is returning something and use that something
*directly in the code. I know this is confusing, so let us look at an
*example of how the factory ALV code can be optimized in terms of
*number of lines using method chaining.

SELECT * FROM sbook INTO TABLE @DATA(bookings).

TRY.
    "Create ALV table object for the output data table
    cl_salv_table=>factory(
                     IMPORTING r_salv_table = DATA(lo_table)
                     CHANGING  t_table      = bookings ).


    "Method chaining
    lo_table->get_functions( )->set_all( ).
    lo_table->get_columns( )->set_optimize( ).
    lo_table->get_display_settings( )->set_striped_pattern( 'X' ).

    lo_table->display( ).
  CATCH cx_root.
    "Handle Error
ENDTRY.

*Using methods as operands

*We use below code to write error after exception is caught.

TRY.
    ...
  CATCH cx_root INTO lo_exception.
    lv_error_txt = lo_exception->get_error_msg( ).
    WRITE: lv_error_txt.
ENDTRY.

*The same can we written as below by using method as an operand. This
*eliminates need of helper variables. Note that this is only possible
*when the method is a functional method i.e. the method has only
*Importing and Returning parameters. The returning value is treated as
*a variable.

TRY.
    ...
  CATCH cx_root INTO lo_exception.
    WRITE: lo_exception->get_error_msg( ).
ENDTRY.
*This can also be used in conditions.

IF lo_exception->get_error_msg( ) IS NOT INITIAL.
ENDIF.

*Avoid Type Conflict while calling methods

*You can convert the data passed to the method to the type that method
*needs.

DATA(lo_abap) = NEW lcl_abap( CONV #('JAGDISHP' ) ).

*Inline declaration for returning/receiving or importing variables

DATA(lv_name) = lo_abap->get_name( ).
*OR
CALL METHOD lo_abap->get_name
  RECEIVING
    rv_name = DATA(lv_name).