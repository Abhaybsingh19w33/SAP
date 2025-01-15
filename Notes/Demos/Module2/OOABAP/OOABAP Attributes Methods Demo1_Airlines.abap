REPORT  z.
CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.

    METHODS: set_attributes IMPORTING
                              im_name      TYPE string
                              im_planetype TYPE saplane-planetype,
      display_attributes.
  PRIVATE SECTION.

    DATA: name      TYPE string,
          planetype TYPE saplane-planetype.

ENDCLASS.                    "lcl_airplane DEFINITION
*------------------------------------------------------------------*
CLASS lcl_airplane IMPLEMENTATION.
  METHOD set_attributes.
    name          = im_name.
    planetype     = im_planetype.
  ENDMETHOD.                    "set_attributes
  METHOD display_attributes.
    WRITE:
           / 'Name of airplane:',  name,
           / 'Type of airplane', planetype.
  ENDMETHOD.                    "display_attributes
ENDCLASS.                    "lcl_airplane IMPLEMENTATION

DATA: r_plane1 TYPE REF TO  lcl_airplane,
      r_plane2 TYPE REF TO  lcl_airplane.

START-OF-SELECTION.
  CREATE OBJECT r_plane1.
  r_plane1->set_attributes( im_name = 'LH Berlin'
                           im_planetype = 'A321' ).

  r_plane1->display_attributes( ).
  CREATE OBJECT r_plane2.
  CALL METHOD r_plane2->set_attributes(
      im_name      = 'AA New York'
      im_planetype = '747-400' ).
*OR
  CALL METHOD r_plane2->set_attributes
    EXPORTING
      im_name      = 'AA New York'
      im_planetype = '747-400'.

  CALL METHOD r_plane2->display_attributes( ).