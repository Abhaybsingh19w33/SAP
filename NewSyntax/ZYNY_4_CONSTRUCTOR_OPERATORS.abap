*&---------------------------------------------------------------------*
*& Report ZYNY_4_CONSTRUCTOR_OPERATORS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zyny_4_constructor_operators.

*link - https://discoveringabap.com/2021/09/23/abap-7-4-and-beyond-4-constructor-operators/

*In this post, you will learn about the below constructor operators.

*NEW
*VALUE
*CORRESPONDING
*FILTER
*COND
*SWITCH
*CONV
*REF
*REDUCE
*EXACT

*NEW – Creates an instance of a class
*This operator is used to create an instance of a class.

"Old way
DATA: lo_abap TYPE REF TO lcl_abap.
CREATE OBJECT lo_abap.

"New way
DATA(lo_abap) = NEW lcl_abap( ).
*WHEN the CLASS has a constructor WITH PARAMETERS, then we can pass the
*PARAMETERS within the brackets ( ).

*value – construct variables, internal tables, and work areas
*value is one of the most useful addition in abap keywords from abap
*7.40. With this keyword, you can create all types of data as shown in
*the below examples.

TYPES : BEGIN OF ty_user,
          user_id   TYPE char12,
          user_name TYPE text40,
        END OF ty_user,

        tt_user TYPE STANDARD TABLE OF ty_user WITH EMPTY KEY.

"Structure
DATA(ls_user)   = VALUE ty_user(  user_id   = 'U_JAGD'
                                  user_name = 'Jagdish P' ).
"Internal table
DATA(lt_itab) = VALUE tt_user(
                  ( user_id = 'U_PATJAG' user_name = 'Jagdish P' )
                  ( user_id = 'U_DOEJOH' user_name = 'John Doe' )
                  ( user_id = 'U_DOEJAN' user_name = 'Jane Doe' )
                ).

L_TAB_DOCTYP = VALUE #( ( SIGN = 'I' OPTION = 'EQ' LOW = 'ZSO' )
                ( SIGN = 'I' OPTION = 'EQ' LOW = 'ZEM' ) ).

"Nested structure
TYPES : BEGIN OF ty_addr,
          house_number TYPE numc4,
          street       TYPE text20,
          city         TYPE text20,
          zip_code     TYPE text20,
        END OF ty_addr,

        BEGIN OF ty_customer,
          name          TYPE text40,
          address       TYPE ty_addr,
          date_of_birth TYPE sy-datum,
        END OF ty_customer.

DATA(john_mayer) = VALUE ty_customer(
                     name    = 'John Doe'
                     address = VALUE #(
                                 house_number = '001'
                                 street       = 'Unique Road Name'
                                 city         = 'Some New City'
                                 zip_code     = '124421'
                               )
                     date_of_birth = '19750101'
                   ).

"Range
DATA lt_range TYPE RANGE OF land1.
lt_range = VALUE #(
             sign = 'I' option = 'EQ'
             (  low = 'IN' )
             (  low = 'US' )
             (  low = 'UK' )
             (  low = 'FR' )
           ).

*the # used after the keyword VALUE along WITH inline DATA declaration.
*this means the type of the variable or fields will be determined
*implicitly or from the earlier declaration. IF you want to use a
*specific TYPE, use the TYPE in place of #.

*in the range construction, as sign = 'I' and option = 'EQ' are common
*for all the entries, hence they are specified only once at the top
*outside the inner ( ).

*corresponding – move between structures and tables.
*WITH this statement, we can MOVE content from one table to another
*table where table TYPES are not exactly the same. this can also be
*used for structures.

TYPES : BEGIN OF ty_base,
          a1 TYPE i,
          a2 TYPE i,
          a3 TYPE char2,
          a4 TYPE char10,
        END OF ty_base,

        BEGIN OF ty_new,
          a1 TYPE i,
          a2 TYPE i,
          b3 TYPE char2,
          b4 TYPE i,
        END OF ty_new.

DATA : ls_base TYPE ty_base,
       ls_new  TYPE ty_new,
       lt_base TYPE STANDARD TABLE OF ty_base,
       lt_new  TYPE STANDARD TABLE OF ty_new,
       lt_dup  TYPE STANDARD TABLE OF ty_base WITH UNIQUE SORTED KEY
                 key1 COMPONENTS a1.

lt_base = VALUE #( ( a1 = 1 a2 = 1  a3 = 'AA' a4 ='One' )
                   ( a1 = 2 a2 = 4  a3 = 'BB' a4 ='Two' )
                   ( a1 = 3 a2 = 9  a3 = 'CC' a4 ='Three' )
                   ( a1 = 4 a2 = 16 a3 = 'DD' a4 ='Four' )
                   ( a1 = 4 a2 = 16 a3 = 'DD' a4 ='Four' ) ).
"Duplicate row

"structure
ls_new = CORRESPONDING #( ls_base ).

"table
lt_new = CORRESPONDING #( lt_base ).

"with mapping of fields with different field name and skip some fields
lt_new = CORRESPONDING #( lt_base MAPPING b4 = a1
                                  EXCEPT  a2 ).
"Handling duplicates
lt_dup = CORRESPONDING #( lt_base DISCARDING DUPLICATES ).

*filter – moves rows from one table to another based on the filter
*condition
*you can move the rows which match the where condition or use except
*and move the rows that do not match the where condition.

DATA messages TYPE SORTED TABLE OF t100 WITH NON-UNIQUE KEY sprsl.

SELECT * FROM t100
  WHERE arbgb = 'SABAPDEMOS'
  ORDER BY msgnr
  INTO TABLE @messages.

"Get all messages in English
DATA(messages_en) = FILTER #( messages WHERE sprsl = 'E' ).

"Get all messages where language is other than English
DATA(messages_non_en) = FILTER #( messages EXCEPT WHERE sprsl = 'E' ).

*Filter Operator
WRITE : / 'Filter Operator'.

*DATA LT_ALL_MATERIAL TYPE STANDARD TABLE OF MARA
*                     WITH NON-UNIQUE SORTED KEY MATNR
*                     COMPONENTS MATNR.
*SELECT *
*       FROM MARA
*       INTO TABLE @DATA(LT_ALL_MATERIALS)
*       UP TO 10000 ROWS.
*
*DATA(LT_MATERIALS_FERT) = FILTER #( LT_ALL_MATERIALS USING KEY MATNR
*                                                     WHERE MATNR = 'A001989210399' ).

SELECT *
       FROM scarr
       INTO TABLE @DATA(carriers).

DATA filter TYPE SORTED TABLE OF scarr-carrid
                 WITH UNIQUE KEY table_line.
filter = VALUE #( ( 'AA ' ) ( 'LH ' ) ( 'UA ' ) ).

WRITE : / 'SCARR'.
WRITE : / 'CAR CARRNAME           CURRC URL'.
LOOP AT carriers INTO DATA(ls_carriers).
  WRITE : / ls_carriers-carrid,
            ls_carriers-carrname,
            ls_carriers-currcode,
            ls_carriers-url.
ENDLOOP.
*cond  and switch – conditional operators
*the condition operator will evaluate a condition specified after when
*and assign the value specified after then. WHEN all the conditions
*mentioned are false, then the value specified after ELSE is assigned.

"COND
DATA(lv_result) = COND #( WHEN sy-msgty = 'S' THEN 'Success'
                          WHEN sy-msgty = 'W' THEN 'Warning'
                          WHEN sy-msgty = 'I' THEN 'Information'
                          WHEN sy-msgty = 'A' THEN 'Abort'
                          ELSE 'Undefined' ).

*switch is similar to cond but it uses a single variable and works
*similarly to a case statement in conventional abap.

"SWITCH
DATA(lv_result) = SWITCH #( sy-msgty WHEN 'S' THEN 'Success'
                            WHEN 'W' THEN 'Warning'
                            WHEN 'I' THEN 'Information'
                            WHEN 'A' THEN 'Abort'
                            ELSE 'Undefined' ).
*cond # will let you WRITE more complex conditions than SWITCH, but
*WHEN you have only one variable, SWITCH is earlier to WRITE and
*understand.

*conv – type conversion
*conv eliminates the need to use helper variables while passing data to
*method parameters or to change and move the value from the field of
*one type to the field of another type.

"Old way
DATA : text   TYPE c LENGTH 255,
       helper TYPE string,
       xstr   TYPE xstring.

helper = text   .   "Move to helper variable
xstr   = cl_abap_codepage=>convert_to( source = helper ).

"New way
DATA : text TYPE c LENGTH 255.
DATA(xstr) = cl_abap_codepage=>convert_to( source = CONV #( text ) ).

*ref – reference operator
*this is used to get the reference of the data.

"Old way
TYPES: tt_flights TYPE STANDARD TABLE OF sflight WITH EMPTY KEY.
DATA : it_flights TYPE tt_flights,
       dref       TYPE REF TO tt_flights.

SELECT * FROM sflight INTO TABLE it_flights.
GET REFERENCE OF it_flights INTO dref.

"New way
SELECT * FROM sflight INTO TABLE @DATA(it_flights).
DATA(dref) = REF #( it_flights ).

*reduce – reduction operator
*reduce creates a result of a specified type using one or more
*iterations (loop). a simple example is, to sum up numbers from 1 to 100.

"With implicit data type
DATA(lv_sum) = REDUCE #( INIT s = 0
                         FOR  i = 1 UNTIL i > 100
                         NEXT s = s + i ).

"With specified data type
DATA(lv_sum) = REDUCE i( INIT s = 0
                         FOR  i = 1 UNTIL i > 100
                         NEXT s = s + i ).
*exact – lossless operator
*exact can be used to assign a variable or expression to the result
*variable. here the types of variables used are usually different.
*WHEN the lossless assignment can not be done i.e. DATA can not be
*converted – exceptions are triggered. for example –

"Conversion error
TYPES numtext TYPE n LENGTH 255.

TRY.
    DATA(number) = EXACT numtext( '4 Apples + 2 Oranges' ).
  CATCH cx_sy_conversion_error INTO DATA(exc).

    MESSAGE 'Exception cx_sy_conversion_error is triggered' TYPE 'E'.
ENDTRY.

"rounding loss
TRY.
    DATA(exact_result) = EXACT #( 3 * ( 1 / 3 ) ).
  CATCH cx_sy_conversion_rounding INTO DATA(lo_exc).
    DATA(rounded_result) = lo_exc->value.
ENDTRY.