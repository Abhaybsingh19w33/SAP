*&---------------------------------------------------------------------*
*& Report ZYNY_1_INLINE_SYNTAX
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zyny_1_inline_syntax.

* Link - https://discoveringabap.com/2021/09/20/abap-7-4-and-beyond-1-inline-data-declarations/

*In this post, you will learn about Inline Data Declarations. The inline
*data declarations are available from ABAP release 7.40.

*Declaring data inline means, declaring the data variables, tables, field
*symbols, etc. in the first statement where they are used as an operand.

*In the below example, the variable lv_number_of_authors is first
*declared and then used in the following statement.

DATA lv_number_of_authors TYPE i.
lv_number_of_authors = 2.

*Instead of this, you can write as below. This is an inline data declaration.

DATA(lv_number_of_authors) = 2.
*In SAP, wherever operands are used, the inline declaration is possible.
*This is basically, instead of a programmer defining the variables' type
*explicitly, allowing the compiler to decide the type.

*********************************Format*********************************
*Context
*Explicit Data Declaration
*Inline Data Declaration
*********************************Format*********************************

*Variables
DATA lv_number_of_authors TYPE i.
lv_number_of_authors = 2.

DATA(lv_number_of_authors) = 2.

*Variables
DATA lv_var2.
lv_var2 = lv_var1.

DATA(lv_var2) = lv_var1.

************************************************************************
*Looping on Internal Tables
DATA ls_work_area LIKE LINE OF lt_itab.
LOOP AT lt_itab INTO ls_work_area.
  "Processing steps
ENDLOOP.

LOOP AT lt_itab INTO DATA(ls_work_area).
  "Processing steps
ENDLOOP.

*looping on internal tables
FIELD-SYMBOLS <fs_row> LIKE LINE OF lt_itab.
LOOP AT lt_itab ASSIGNING <fs_row>.
  "Processing steps
ENDLOOP.

LOOP AT lt_itab ASSIGNING FIELD-SYMBOL(<fs_row>).
  "Processing steps
ENDLOOP.
************************************************************************
*temporary internal table
DATA: lt_tmp_table LIKE lt_itab.
lt_tmp_table = lt_itab.

DATA(lt_tmp_table) = lt_itab.
************************************************************************
*reading internal table
DATA ls_work_area LIKE LINE OF lt_itab.
READ TABLE lt_itab INTO ls_work_area INDEX 1.
IF sy-subrc EQ 0.
  "Code for successful READ
ELSE.
  "Code for failed READ
ENDIF.


READ TABLE lt_itab INTO DATA(ls_work_area) INDEX 1.
IF sy-subrc EQ 0.
  "Code for successful READ
ELSE.
  "Code for failed READ
ENDIF.
************************************************************************
*reading internal table
FIELD-SYMBOLS <fs_row> LIKE LINE OF lt_itab.
READ TABLE lt_itab ASSIGNING <fs_row> INDEX 1.
IF sy-subrc EQ 0.
  "Code for successful READ
ELSE.
  "Code for failed READ
ENDIF.

READ TABLE lt_itab ASSIGNING FIELD-SYMBOL(<fs_row>) INDEX 1.
IF sy-subrc EQ 0.
  "Code for successful READ
ELSE.
  "Code for failed READ
ENDIF.

*reading internal table  note:
*old read statement is used for demonstration.
*NEW read SYNTAX can be used as shown here.
TRY.
    DATA(ls_work_area1) = lt_itab[ 1 ].
    "Code for successful READ
  CATCH cx_sy_itab_line_not_found.
    "Code for failed READ
ENDTRY.
************************************************************************

*SELECT query
TYPES:
  BEGIN OF ty_fls,
    carrid TYPE sflight-carrid,
    connid TYPE sflight-connid,
    fldate TYPE sflight-fldate,
  END OF ty_fls.

DATA lt_flights TYPE STANDARD TABLE OF ty_fls.

SELECT carrid connid fldate
FROM sflight
INTO TABLE lt_flights.

SELECT carrid, connid, fldate
FROM sflight
INTO TABLE @DATA(lt_flights).
************************************************************************

*METHOD call
DATA lv_result TYPE char5.
sample_method(
  EXPORTING iv_input = iv_test
  IMPORTING iv_result = lv_result ).

sample_method(
  EXPORTING iv_input = iv_test
  IMPORTING iv_result = DATA(lv_result) ).
************************************************************************

*support variable
DATA lv_count TYPE i.
FIND 'J' IN 'JAGDISH' MATCH COUNT lv_count.

FIND 'J' IN 'JAGDISH' MATCH COUNT DATA(lv_count).
************************************************************************

*objects
DATA lo_obj TYPE REF TO lcl_abap.
CREATE OBJECT lo_obj.

DATA(lo_obj) = NEW lcl_abap( ).
************************************************************************

*factory alv, object, and exceptions
DATA :
  lt_out_tab  TYPE STANDARD TABLE OF scarr,
  lo_table    TYPE REF TO cl_salv_table,
  lo_function TYPE REF TO cl_salv_functions_list,
  lx_msg      TYPE REF TO cx_salv_msg,
  lx_alv      TYPE REF TO cx_salv_not_found.

SELECT * FROM scarr INTO TABLE lt_out_tab.

TRY.
    cl_salv_table=>factory(
      IMPORTING r_salv_table = lo_table
      CHANGING  t_table      = lt_out_tab ).

    lo_function = lo_table->get_functions( ).
    lo_function->set_all( ).

  CATCH   cx_salv_msg INTO lx_msg.
    "Handle Error
  CATCH cx_salv_not_found INTO lx_alv.
    "Handle Error
ENDTRY.


SELECT * FROM scarr INTO TABLE @DATA(lt_out_tab).
TRY.
    cl_salv_table=>factory(
      IMPORTING r_salv_table = DATA(lo_table)
      CHANGING  t_table      = lt_out_tab ).
    DATA(lo_function) = lo_table->get_functions( ).
    lo_function->set_all( ).
  CATCH cx_salv_msg INTO DATA(lx_msg).
    "Handle Error
  CATCH cx_salv_not_found INTO DATA(lx_alv).
    "Handle Error
ENDTRY.
************************************************************************

*Declaring data using this method reduces the number of lines of code,
*changes like adding a field to the structure are easy to implement and
*it gives flexibility to the programmer and eliminates the need to use
*too many helper variables.