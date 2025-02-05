REPORT  ZVKAIRPLANE3.
CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.
    CONSTANTS: pos_1 TYPE i VALUE 30.
    DATA: pub_attr  TYPE i.

    METHODS: set_attributes IMPORTING
                              im_name      TYPE string
                              im_planetype TYPE saplane-planetype,
      display_attributes.

    CLASS-METHODS: display_no_of_airplanes.

  PRIVATE SECTION.
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
DATA: r_plane TYPE REF TO  lcl_airplane,
      r_plane1 TYPE REF TO  lcl_airplane,
      r_plane2 TYPE REF TO  lcl_airplane,
      r_plane3 TYPE REF TO  lcl_airplane,
      plane_list TYPE TABLE OF REF to lcl_airplane.

START-OF-SELECTION.
CREATE OBJECT r_plane.

CREATE OBJECT r_plane1.
r_plane1->pub_attr = 10.
r_plane1->set_attributes( im_name = 'LH Berlin'
                         im_planetype = 'A321' ).
APPEND r_plane1 to plane_list.

CREATE OBJECT r_plane2.
r_plane2->pub_attr = 20.
CALL METHOD r_plane2->set_attributes( im_name = 'AA New York'
                           	     im_planetype = '747-400' ).
APPEND r_plane2 to plane_list.

CREATE OBJECT r_plane3.
r_plane3->pub_attr = 30.
CALL METHOD r_plane3->set_attributes( im_name = 'US Herclues'
                           im_planetype = '747-500' ).
APPEND r_plane3 to plane_list.

lcl_airplane=>DISPLAY_NO_OF_AIRPLANES( ).

LOOP AT plane_list INTO r_plane. "  WHERE TABLE_LINE->pub_attr = 20.
    r_plane->display_attributes( ).
ENDLOOP.
skip.
LOOP AT plane_list INTO r_plane  WHERE TABLE_LINE->pub_attr = 20.
    r_plane->display_attributes( ).
ENDLOOP.

skip.

READ TABLE plane_list INTO r_plane
WITH KEY table_line->pub_attr = 10.
 r_plane->display_attributes( ).