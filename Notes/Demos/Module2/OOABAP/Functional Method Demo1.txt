REPORT  Z.
* Class with functional method
CLASS LCL_AIRPLANE DEFINITION.
  PUBLIC SECTION.
    CONSTANTS POS_1 TYPE I VALUE 30.
    DATA PUB_ATTR  TYPE I.
    METHODS: SET_ATTRIBUTES IMPORTING
                              IM_NAME      TYPE STRING
                              IM_PLANETYPE TYPE SAPLANE-PLANETYPE,
      DISPLAY_ATTRIBUTES,
      GET_NO_AIRPLANES RETURNING VALUE(RE_COUNT) TYPE I.

    CLASS-METHODS DISPLAY_NO_AIRPLANES.

  PRIVATE SECTION.
    DATA: NAME      TYPE STRING,
          PLANETYPE TYPE SAPLANE-PLANETYPE.
    CLASS-DATA NO_AIRPLANES TYPE I.

ENDCLASS.                    "lcl_airplane DEFINITION

*------------------------------------------------------------------*
*       CLASS lcl_airplane IMPLEMENTATION                          *
*------------------------------------------------------------------*
CLASS LCL_AIRPLANE IMPLEMENTATION.

  METHOD SET_ATTRIBUTES.
    NAME          = IM_NAME.
    PLANETYPE     = IM_PLANETYPE.
    NO_AIRPLANES = NO_AIRPLANES + 1.
  ENDMETHOD.                    "set_attributes

  METHOD DISPLAY_ATTRIBUTES.
    WRITE:
          / 'Name of airplane:', AT POS_1 NAME,
          / 'Type of airplane', AT POS_1 PLANETYPE.
  ENDMETHOD.                    "display_attributes

  METHOD DISPLAY_NO_AIRPLANES.
    WRITE: /, / 'Total number of airplanes',
           AT POS_1 NO_AIRPLANES LEFT-JUSTIFIED, /.
  ENDMETHOD.                    "display_n_o_airplanes

  METHOD GET_NO_AIRPLANES.
    RE_COUNT = NO_AIRPLANES.
  ENDMETHOD.
ENDCLASS.                    "lcl_airplane IMPLEMENTATION

DATA: R_PLANE1 TYPE REF TO LCL_AIRPLANE,
      R_PLANE2 TYPE REF TO LCL_AIRPLANE,
      R_PLANE3 TYPE REF TO LCL_AIRPLANE,
      COUNT    TYPE I.

START-OF-SELECTION.
*##############################

  LCL_AIRPLANE=>DISPLAY_NO_AIRPLANES( ).

  CREATE OBJECT R_PLANE1.
  R_PLANE1->SET_ATTRIBUTES( IM_NAME = 'LH Berlin'
                           IM_PLANETYPE = 'A321' ).

  CREATE OBJECT R_PLANE2.
  R_PLANE2->SET_ATTRIBUTES( IM_NAME = 'AA New York'
                           IM_PLANETYPE = '747-400' ).

  CREATE OBJECT R_PLANE3.
  R_PLANE3->SET_ATTRIBUTES( IM_NAME = 'US Hercules'
                          IM_PLANETYPE = '747-500' ).


* long syntax for functional call:
* CALL METHOD r_plane1->get_no_airplanes
*   RECEIVING
*     re_count = count.

  "a little bit shorter:
  "  r_plane1->get_no_airplanes( RECEIVING re_count = count ).

* the shortest syntax for functional call:
  COUNT = R_PLANE1->GET_NO_AIRPLANES( ).
  SKIP 2.
  WRITE: / 'The count is', COUNT.