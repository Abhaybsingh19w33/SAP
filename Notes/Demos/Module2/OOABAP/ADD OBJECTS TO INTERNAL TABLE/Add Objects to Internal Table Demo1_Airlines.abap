REPORT  z.
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
           / 'Name of airplane:', name,
           / 'Type of airplane', planetype.
  ENDMETHOD.                    "display_attributes

  METHOD display_no_of_airplanes.
    WRITE: /, / 'Total number of airplanes',
            no_of_airplanes LEFT-JUSTIFIED, /.
  ENDMETHOD.                    "display_n_o_airplanes

ENDCLASS.                    "lcl_airplane IMPLEMENTATION
DATA: r_plane    TYPE REF TO  lcl_airplane,
      plane_list TYPE TABLE OF REF TO lcl_airplane.

START-OF-SELECTION.

  CREATE OBJECT r_plane.
  APPEND r_plane TO plane_list.
  r_plane->set_attributes( im_name = 'LH Berlin'
                           im_planetype = 'A321' ).
  r_plane->display_attributes( ).
  r_plane->display_no_of_airplanes( ).

  CREATE OBJECT r_plane.
  APPEND r_plane TO plane_list.
  CALL METHOD r_plane->set_attributes(
      im_name      = 'AA New York'
      im_planetype = '747-400' ).
  CALL METHOD r_plane->display_attributes( ).
  lcl_airplane=>display_no_of_airplanes( ).

  CREATE OBJECT r_plane.
  APPEND r_plane TO plane_list.
  CALL METHOD r_plane->set_attributes(
      im_name      = 'US Herclues'
      im_planetype = '747-500' ).

  LOOP AT plane_list INTO r_plane.
    CALL METHOD r_plane->display_attributes( ).
  ENDLOOP.