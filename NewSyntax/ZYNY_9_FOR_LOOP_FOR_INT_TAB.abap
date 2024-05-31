*&---------------------------------------------------------------------*
*& Report ZYNY_9_FOR_LOOP_FOR_INT_TAB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZYNY_9_FOR_LOOP_FOR_INT_TAB.

*Link - https://discoveringabap.com/2021/10/15/abap-7-4-and-beyond-9-for-loop-for-internal-tables/

*-> For Loop for Internal Tables
*-> Keyword LET
*-> Nested For Loops

*FOR Iteration for Single Table
*FOR is also called Iteration Expression.

*Consider below code

TYPES: BEGIN OF ty_flight,
        seq_num TYPE i,
        carrier TYPE s_carrname,
        connect TYPE s_conn_id,
        fldate  TYPE s_date,
       END OF ty_flight.
       
DATA lt_new_flights TYPE STANDARD TABLE OF ty_flight.
       
SELECT * FROM sflight INTO TABLE @DATA(lt_flights).
IF sy-subrc EQ 0.
  SELECT * FROM scarr INTO TABLE @DATA(lt_scarr).
  lt_new_flights = VALUE #( 
                     FOR ls_flight IN lt_flights INDEX INTO lv_index
                     (
                        seq_num = lv_index
                        carrier = lt_scarr[ carrid = ls_flight-carrid ]-carrname
                        connect = ls_flight-connid
                        fldate = ls_flight-fldate
                     )
                   ).
  cl_demo_output=>display( lt_new_flights ).
ENDIF.

*This is a simple For Loop for table lt_flights. Index keyword is 
*optional here. This code simply transfers data from one table to 
*another.

*This is another way to write LOOP AT and APPEND kind of code.

DATA : ls_new_flight TYPE ty_flight.
LOOP AT lt_flights INTO DATA(ls_flight).
  ls_new_flight_seq_num = sy-tabix.
  ls_new_flight-carrier = lt_scarr[ carrid = ls_flight-carrid ]-carrname.
  ls_new_flight- connect = ls_flight-connid.
  ls_new_flight-fldate = ls_flight-fldate.
  APPEND ls_new_flight TO lt_new_flights.
ENDLOOP.

*Similar to LOOP AT, you can also write where conditions except the 
*mandatory ( ).

lt_new_flights = VALUE #(
                    FOR ls_flight IN lt_flights INDEX INTO lv_index 
                      WHERE ( carrid = 'AA' and connid = '0017' )
                    (
                      seq_num = lv_index
                      connect = ls_flight-connid
                      fldate = ls_flight-fldate
                    )
                 ).
cl_demo_output=>display( lt_new_flights ).

*FOR Iteration and LET expression

*LET can be used to define variables and assign them to target table 
*fields.

lt_new_flights = VALUE #(
                    FOR ls_flight IN lt_flights INDEX INTO lv_index 
                      WHERE ( carrid = 'AA' and connid = '0017' )
                    LET lv_carrname = lt_scarr[ carrid = ls_flight-carrid ]-carrname
                    IN carrier = lv_carrname 
                    (
                      seq_num = lv_index
                      connect = ls_flight-connid
                      fldate = ls_flight-fldate
                    )
                 ).

*Nested FOR Iterations

*This is similar to LOOP inside a LOOP. This way multiple FOR 
*Iterations can be nested.

lt_new_flights = VALUE #( 
                    FOR ls_scarr in lt_scarr
                    FOR ls_flight IN lt_flights WHERE ( carrid = ls_scarr-carrid )
                    (
                      carrier = ls_scarr-carrname
                      connect = ls_flight-connid
                      fldat = ls_flight-fldate
                    )                          
                 ). 

*Code in text format

TYPES : BEGIN OF ty_flight,
          seq_num type i,
          carrier TYPE s_carrname,
          connect TYPE s_conn_id,
          fldate  TYPE s_date,
        END OF ty_flight.

DATA lt_new_flights TYPE STANDARD TABLE OF ty_flight.

SELECT * FROM sflight INTO TABLE @DATA(lt_flights).
IF sy-subrc EQ 0.
  SELECT * FROM scarr INTO TABLE @DATA(lt_scarr).

ENDIF.

"FOR Iteration 
lt_new_flights =
  VALUE #(
    FOR ls_flight IN lt_flights INDEX INTO lv_index
                                WHERE ( carrid = 'AA' AND
                                        connid = '0017' )
    LET lv_carrname = lt_scarr[ carrid = ls_flight-carrid ]-carrname
    IN  carrier = lv_carrname
    ( seq_num = lv_index
      connect = ls_flight-connid
      fldate  = ls_flight-fldate
    )
  ).

cl_demo_output=>display( lt_new_flights ).
"LOOP AT Method 
DATA: ls_new_flight TYPE ty_flight.
LOOP AT lt_flights INTO DATA(ls_flight).
  ls_new_flight-seq_num = sy-tabix.
  ls_new_flight-carrier = lt_scarr[ carrid = ls_flight-carrid 
]-carrname.
  ls_new_flight-connect = ls_flight-connid.
  ls_new_flight-fldate  = ls_flight-fldate.
  APPEND ls_new_flight TO lt_new_flights.
ENDLOOP.

cl_demo_output=>display( lt_new_flights ).
"Nested FOR Iterations
lt_new_flights =
  VALUE #(
    FOR ls_scarr in lt_scarr
    FOR ls_flight IN lt_flights WHERE ( carrid = ls_scarr-carrid )
    (
      carrier = ls_scarr-carrname
      connect = ls_flight-connid
      fldate  = ls_flight-fldate
    )
  ).