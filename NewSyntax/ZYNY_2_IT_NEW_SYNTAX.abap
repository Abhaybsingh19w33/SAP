*&---------------------------------------------------------------------*
*& Report ZYNY_2_IT_NEW_SYNTAX
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zyny_2_it_new_syntax.

*Link -  https://discoveringabap.com/2021/09/21/abap-7-4-and-beyond-2-read-internal-tables-with-new-syntax/#google_vignette

*In this post, you will learn about the new read syntax introduced in
abap release 7.40.

*This was introduced way back in 2013, so this is not new anymore. But,
*if you are still using READ TABLE keywords to read table entries, this
*post is definitely for you. Take a look at the below examples.

*Consider that the below code is written before the read statements.

DATA : it_flights TYPE STANDARD TABLE OF sflight,
       ls_flight  TYPE zjp_order.

SELECT * FROM sflight INTO TABLE it_flights .

*It is possible to use inline data declaration here to create an
*internal table and work area but it is declared explicitly at the top
*so that we can focus on the READ TABLE syntax

*********************************Format*********************************
*Context
*Before ABAP 7.40
*From ABAP 7.40
*********************************Format*********************************
*Read with index number
READ TABLE it_flights INTO ls_flight INDEX 1.

ls_flight = it_flights[ 1 ].
************************************************************************
*Read with index variable
READ TABLE it_flights INTO ls_flight INDEX lv_idx.

ls_flight = it_flights[ lv_idx ].
************************************************************************
*Read with free key
READ TABLE it_flights INTO ls_flight WITH KEY carrid = 'SQ'.

ls_flight = it_flights[ carrid = 'SQ' ].
************************************************************************
*Read with more than one free key
READ TABLE it_flights INTO ls_flight WITH KEY carrid = 'SQ' connid = '0026'.

ls_flight = it_flights[ carrid = 'SQ' connid = '0026' ].
************************************************************************

*If you are trying out the above code example – please add the below
*code block before these statements.

SELECT * FROM sflight INTO TABLE @DATA(it_flights).
DATA(lv_idx) = 2.

*The important thing to note here is that the new expression
* -> Does not change sy-subrc value
* -> Raises an exception CX_SY_ITAB_LINE_NOT_FOUND when the read expression fails

"Write read expressions in TRY-CATCH blocks
TRY .
    DATA(ls_flight) = it_flights[ 1 ].

    MESSAGE 'Read successful' TYPE 'S'.
  CATCH cx_sy_itab_line_not_found.
    MESSAGE 'Read failed' TYPE 'E'.
ENDTRY.

*the control will move to CATCH block when READ fails. you can handle
*the sy-subrc <> 0 cases in CATCH block.

*As this is an expression and not a statement, it can be used at any
*operand position, which was impossible with the READ TABLE statement.

*For example,

*  1. a field from the result can be used with – the field name.

data(plane_type) = it_flights[ connid = '0026' ]-planetype.
*  2. it can be used in IF blocks

IF it_flights[ connid = '0026' ]-planetype = 'A319'.
  "Do something
ELSE.
  "Do something else
ENDIF.

*the result of the expression can be assigned to a field symbol as
*well. In this case, the exception is not required to be handled but a
*sy-subrc check works just fine.

ASSIGN it_flights[ carrid = 'SQ' ] to FIELD-SYMBOL(<fs_flight>).
IF sy-subrc EQ 0.
  "Read is successful
ELSE.
  "Read has failed
ENDIF.

*In the scenarios where handling the case where READ failed is not at
*all required, you can skip the try-catch using the OPTIONAL keyword.

ls_flight = VALUE #( it_flights[ carrid = 'AA' ] OPTIONAL ).

*here, you have to be careful as the variable/structure will be blank
*in case the read fails. so do not use this just to avoid using
*try-catch but use it only when there is an actual need.

*Binary Search in new READ syntax

*Before I end this post, an important question is – what about BINARY
*search?

*well, use sorted table and binary search would be used
*implicitly.

DATA : it_flights TYPE SORTED TABLE OF sflight
                  WITH UNIQUE KEY carrid connid.

"Get flight data
SELECT * FROM sflight INTO TABLE it_flights .

"Read with key
data(ls_flight) = it_flights [ carrid = 'SQ' connid = '0026' ].