REPORT  ZVKVEHICLE1.
TYPE-POOLS icon.
*---------------------------------------------------------------------*
CLASS lcl_vehicle DEFINITION.

  PUBLIC SECTION.
    "-------------------
    METHODS: get_average_fuel IMPORTING im_distance TYPE s_distance
                                        im_fuel TYPE s_capacity
                              RETURNING value(re_avgfuel) TYPE s_consum.
    METHODS       constructor IMPORTING im_make TYPE string.
    METHODS       display_attributes.
    METHODS       set_make IMPORTING im_make TYPE string.
    METHODS       get_make EXPORTING ex_make TYPE string.
    CLASS-METHODS get_count EXPORTING re_count TYPE i.

  PRIVATE SECTION.
    "-------------------
    DATA: make   TYPE string.
    METHODS      init_make.
    CLASS-DATA:  n_o_vehicles TYPE i.

ENDCLASS.                    "lcl_vehicle DEFINITION

*---------------------------------------------------------------------*
*       CLASS lcl_vehicle IMPLEMENTATION
*---------------------------------------------------------------------*
*
*---------------------------------------------------------------------*
CLASS lcl_vehicle IMPLEMENTATION.
  METHOD get_average_fuel.
    re_avgfuel = im_distance / im_fuel.
  ENDMETHOD.                    "get_average_fuel

  METHOD constructor.
    make = im_make.
    ADD 1 TO n_o_vehicles.
  ENDMETHOD.                    "constructor

  METHOD set_make.
    IF im_make IS INITIAL.
      init_make( ).   " me->init_make( ). also possible
    ELSE.
      make = im_make.
    ENDIF.
  ENDMETHOD.                    "set_make

  METHOD init_make.
    make = 'default make'.
  ENDMETHOD.                    "init_make

  METHOD get_make.
    ex_make = make.
  ENDMETHOD.                    "get_make

  METHOD display_attributes.
    WRITE: make.
  ENDMETHOD.                    "display_attributes

  METHOD get_count.
    re_count = n_o_vehicles.
  ENDMETHOD.                    "get_count

ENDCLASS.                    "lcl_vehicle IMPLEMENTATION


*---------------------------------------------------------------------*
*       CLASS lcl_truck DEFINITION
*---------------------------------------------------------------------*
*
*---------------------------------------------------------------------*
CLASS lcl_truck DEFINITION INHERITING FROM lcl_vehicle.

  PUBLIC SECTION.
    "-------------------
    METHODS:      constructor IMPORTING im_make TYPE string
                                        im_cargo TYPE s_plan_car.

    METHODS       display_attributes REDEFINITION.
    METHODS       get_cargo RETURNING value(re_cargo) TYPE s_plan_car.

  PRIVATE SECTION.
    "-------------------
    DATA: max_cargo TYPE s_plan_car.

ENDCLASS.                    "lcl_truck DEFINITION

*---------------------------------------------------------------------*
*       CLASS lcl_truck IMPLEMENTATION
*---------------------------------------------------------------------*
*
*---------------------------------------------------------------------*
CLASS lcl_truck IMPLEMENTATION.

  METHOD constructor.
    super->constructor( im_make ).
    max_cargo = im_cargo.
  ENDMETHOD.                    "constructor

  METHOD display_attributes.
    WRITE: / 'Truck'.
    WRITE: / icon_ws_truck AS ICON.
    super->display_attributes( ).
    WRITE: 20 ' Cargo = ', max_cargo.
    ULINE.
  ENDMETHOD.                    "display_attributes

  METHOD get_cargo.
    re_cargo = max_cargo.
  ENDMETHOD.                    "get_cargo

ENDCLASS.                    "lcl_truck DEFINITION

DATA: r_vehicle TYPE REF TO lcl_vehicle,
      r_truck TYPE REF TO lcl_truck,
      itab TYPE TABLE OF REF TO lcl_vehicle.

START-OF-SELECTION.

CREATE OBJECT r_vehicle  EXPORTING im_make = 'MAN'.
r_vehicle->display_attributes( ).
append r_vehicle to itab.

CREATE OBJECT r_vehicle  EXPORTING im_make = 'MAN1'.
append r_vehicle to itab.

LOOP AT itab INTO r_vehicle.
    r_vehicle->display_attributes( ).
ENDLOOP.

******** create truck *****************************************
  CREATE OBJECT r_truck EXPORTING im_make = 'MAN'
                                  im_cargo = 45.

   r_truck->display_attributes( ).
*  The above two methods display the attributes of truck