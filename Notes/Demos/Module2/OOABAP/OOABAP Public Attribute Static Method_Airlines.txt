REPORT  ZVKAIRPLANE1A.
*Class with Static Method, constant and public attribute
CLASS lcl_airplane DEFINITION.

PUBLIC SECTION.
"--------------------------------
    CONSTANTS: pos_1 TYPE i VALUE 30.
    DATA: pub_attr  TYPE i.

    METHODS: set_attributes IMPORTING
                   im_name      TYPE string
                   im_planetype TYPE saplane-planetype. "sapplane is a transparent table

   METHODS    display_attributes.

    CLASS-METHODS: display_no_of_airplanes.

PRIVATE SECTION.
"----------------------------------
    DATA: name      TYPE string,
          planetype TYPE saplane-planetype.

    CLASS-DATA: no_of_airplanes TYPE i.

ENDCLASS.                    "lcl_airplane DEFINITION

*------------------------------------------------------------------*
*       CLASS lcl_airplane IMPLEMENTATION                          *
*------------------------------------------------------------------*
CLASS lcl_airplane IMPLEMENTATION.

METHOD set_attributes.
    name          = im_name.
    planetype     = im_planetype.
    no_of_airplanes = no_of_airplanes + 1.
ENDMETHOD.                    "set_attributes

  METHOD display_attributes.
    WRITE:
           / 'Name of airplane:'(001), AT pos_1 name,
           / 'Type of airplane'(002), AT pos_1 planetype.
  ENDMETHOD.                    "display_attributes

  METHOD display_no_of_airplanes.
    WRITE: /, / 'Total number of airplanes'(ca1),
           AT pos_1 no_of_airplanes LEFT-JUSTIFIED, /.
  ENDMETHOD.                    "display_n_o_airplanes

ENDCLASS.                    "lcl_airplane IMPLEMENTATION
DATA: r_plane TYPE REF TO  lcl_airplane.

START-OF-SELECTION.
CREATE OBJECT r_plane.
r_plane->set_attributes( im_name = 'LH Berlin'
                         im_planetype = 'A321' ).
r_plane->display_attributes( ).

r_plane->DISPLAY_NO_OF_AIRPLANES( ).

CALL METHOD r_plane->set_attributes( im_name = 'AA New York'
                                     im_planetype = '747-400' ).
CALL METHOD r_plane->display_attributes( ).

lcl_airplane=>DISPLAY_NO_OF_AIRPLANES( ).