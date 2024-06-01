*&---------------------------------------------------------------------*
*& Report zcs_new_syntax4
*&---------------------------------------------------------------------*
*& reading internal table using index
*& reading internal table using key
*& sorted table examples
*Deep Structure
*Dereferencing
*&---------------------------------------------------------------------*
REPORT zcs_new_syntax4.

"Reading record from internal table
SELECT
  carrid,
  connid,
  cityfrom,
  cityto
  FROM spfli
  INTO TABLE @DATA(itab).

*Classic - 10th rec from it_sales
"READ TABLE ITAB INTO DATA(WA) INDEX 10.
"WRITE : / WA-CARRID, WA-CONNID.
"CLEAR WA.

*optimised abap
DATA(wa) = itab[ 10 ].
WRITE : / wa-carrid, wa-connid.
SKIP.

*&---------------------------------------------------------------------*
"READ TABLE ITAB INTO DATA(WA) WITH KEY CARRID = 'AA' CONNID = '017'.
"WRITE : / WA-CARRID, WA-CONNID.
"CLEAR WA.

*optimised abap
wa = itab[ carrid = 'AA' connid = '017' ].
WRITE : / wa-carrid, wa-connid.
SKIP.

*&---------------------------------------------------------------------*
TYPES t_itab TYPE SORTED TABLE OF i WITH UNIQUE KEY table_line.
DATA(dref) = VALUE t_itab( ( 100 ) ( 200 ) ( 3000 ) ).
LOOP AT dref INTO DATA(wa_dref).
  WRITE : / wa_dref.
ENDLOOP.
SKIP.

DATA(dref2) = VALUE t_itab( ( 100 ) ( ) ( 3000 ) ).
LOOP AT dref2 INTO DATA(wa_dref2).
  WRITE : / wa_dref2.
ENDLOOP.
SKIP.

*&---------------------------------------------------------------------*
*NEW SYNTAX
TYPES : BEGIN OF ty_itab,
          num1 TYPE i,
        END   OF ty_itab.

TYPES t_itab2 TYPE SORTED TABLE OF ty_itab WITH UNIQUE KEY num1.
DATA(itab_o) = VALUE t_itab2( ( num1 = 10 ) ( num1 = 20 ) ( num1 = 30 ) ).

LOOP AT itab_o INTO DATA(wa3).
  WRITE : / wa3-num1.
ENDLOOP.
SKIP.

*&---------------------------------------------------------------------*
TYPES: BEGIN OF myscarr,
         carrid   TYPE s_carr_id,
         carrname TYPE s_carrname,
       END OF myscarr.

TYPES itab TYPE SORTED TABLE OF myscarr WITH UNIQUE KEY carrid.
DATA(lv) = VALUE itab(
                      ( carrid = 'AA' carrname = 'American Airlines' )
                      ( carrid = 'AB' carrname = 'Air Berlin' )
                      ).

LOOP AT lv INTO DATA(wa4).
  WRITE : / wa4-carrid.
  WRITE wa4-carrname.
ENDLOOP.
SKIP.

TYPES itab2 TYPE STANDARD TABLE OF i WITH DEFAULT KEY.
DATA(dref3) = VALUE itab2( ( 100 ) ( ) ( 3000 ) ).

LOOP AT dref3 INTO DATA(wa5).
  WRITE : / wa4.
ENDLOOP.
SKIP.

*&---------------------------------------------------------------------*
TYPES: BEGIN OF ty_deep,
         kunnr TYPE kunnr,
         name1 TYPE name1,
         ort01 TYPE ort01,
         t_col TYPE lvc_t_scol,
       END OF ty_deep.

TYPES: tty_deep TYPE STANDARD TABLE OF ty_deep WITH DEFAULT KEY.

DATA(lv1) = NEW tty_deep(
  ( kunnr = '100111'
    name1 = 'John'
    ort01 = 'AMS'
    t_col = VALUE #( ( fname = 'ABC' color-col = 4 color-inv = 1 color-int = 2 )
                     ( fname = 'LMN' color-col = 4 color-inv = 1 color-int = 2 ) ) )

  ( kunnr = '200222'
    name1 = 'Raj'
    ort01 = 'CAL'
    t_col = VALUE #( ( fname = 'PQR' color-col = 4 color-inv = 1 color-int = 2 )
                     ( fname = 'XYZ' color-col = 4 color-inv = 1 color-int = 2 ) ) )
).

DATA(lv2) = lv1->* .

*cl_demo_output=>display( lv1->* ). "DATA TYPE NOT SUPPORTED
*cl_demo_output=>display( lv1 ). "Only print reference in pop up

LOOP AT lv2 INTO DATA(wa6).
  WRITE : / '-> ',
            wa6-kunnr,
            wa6-name1,
            wa6-ort01.
  LOOP AT wa6-t_col INTO DATA(wa7).
    WRITE : / '--> ',
              wa7-fname,
              wa7-color-col,
              wa7-color-inv,
              wa7-color-int.
  ENDLOOP.
ENDLOOP.
SKIP.

*&---------------------------------------------------------------------*
"OLD METHOD
TYPES ty_matnr2 TYPE matnr.
DATA  tp_matnr2 TYPE ty_matnr2 VALUE 9001.
WRITE : / tp_matnr2.

"NEW METHOD
TYPES ty_matnr TYPE matnr.
DATA(tp_matnr) = NEW ty_matnr( '9000' ).
WRITE : / tp_matnr->* . "TP_MATNR can be converted to a character-like value
*WRITE TP_MATNR.

"->* is the dereferencing keyword.

*&---------------------------------------------------------------------*

TABLES spfli.
DATA: lt_flights_all TYPE STANDARD TABLE OF spfli,
      lt_flight_lh   TYPE STANDARD TABLE OF spfli.

SELECT *  FROM spfli
          INTO TABLE @lt_flights_all.

IF sy-subrc = 0.
  LOOP AT lt_flights_all INTO DATA(ls_flight) WHERE carrid = 'LH'.
    APPEND ls_flight TO lt_flight_lh.
    CLEAR ls_flight.
  ENDLOOP.
ENDIF.

WRITE : / 'Count of record using no filter ', lines( lt_flight_lh ).
*cl_demo_output=>display( lt_flight_lh ).

DATA lt_flights_all2 TYPE STANDARD TABLE OF spfli
                     WITH NON-UNIQUE SORTED KEY carrid
                     COMPONENTS carrid.
SELECT *  FROM spfli
          INTO TABLE @lt_flights_all2.

DATA(lt_flight_lh2) = FILTER #( lt_flights_all2 USING KEY carrid
                                                WHERE carrid = 'LH ' ).
WRITE : / 'Count of record using filter ', lines( lt_flight_lh2 ).

* Create a filter internal table with multiple values
DATA filter_tab  TYPE SORTED TABLE OF scarr-carrid
                 WITH UNIQUE KEY table_line.

filter_tab = VALUE #( ( 'AA ' ) ( 'LH ' ) ( 'AB ' ) ( 'AC ' ) ).
* Apply filters
CLEAR lt_flight_lh2.
lt_flight_lh2 = FILTER #( lt_flights_all IN filter_tab
                                           WHERE carrid = table_line ).
LOOP AT lt_flight_lh2 INTO DATA(wa8).
  WRITE : / wa8-carrid.
ENDLOOP.
*cl_demo_output=>display( lt_flight_lh ).
*&---------------------------------------------------------------------*

DATA members LIKE lt_flight_lh2.

LOOP AT lt_flight_lh2 INTO DATA(flight)
    GROUP BY ( carrier = flight-carrid cityfr = flight-cityfrom )
    ASCENDING ASSIGNING FIELD-SYMBOL(<group>).

  CLEAR members.
  LOOP AT GROUP <group> ASSIGNING FIELD-SYMBOL(<flight>).
    members = VALUE #( BASE members ( <flight> ) ).
    WRITE : / <flight>-carrid, <flight>-connid, <flight>-countryfr.
  ENDLOOP.
*  cl_demo_output=>write( members ).
  SKIP.
ENDLOOP.
*cl_demo_output=>display( ).
*&---------------------------------------------------------------------*

LOOP AT lt_flight_lh2 INTO DATA(WA9)
  GROUP BY WA9-CARRID .
  WRITE / WA9-CARRID.
ENDLOOP.

LOOP AT lt_flight_lh2 INTO DATA(WA10)
                  GROUP BY ( Key1 = WA10-CARRID Key2 = WA10-CONNID ).
  WRITE :/ WA10-CARRID, WA10-CONNID .
ENDLOOP.