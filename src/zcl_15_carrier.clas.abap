CLASS zcl_15_carrier DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  interfaces zif_15_partner.
    METHODS add_airplane            IMPORTING airplane     TYPE REF TO zcl_15_airplane.
    METHODS get_biggest_cargo_plane RETURNING VALUE(resultplane) TYPE REF TO zcl_15_airplane.

    DATA name      TYPE string        READ-ONLY.

    DATA airplanes TYPE z15_airplanes READ-ONLY.

    METHODS constructor
      IMPORTING !name TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_carrier IMPLEMENTATION.

  METHOD constructor.

    me->name = name.

  ENDMETHOD.

  METHOD add_airplane.
    APPEND airplane TO airplanes.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.
    DATA max_weight  TYPE i VALUE 0.
    DATA cargo_plane TYPE REF TO zcl_15_airplane.

    LOOP AT airplanes INTO DATA(plane).
      IF plane IS INSTANCE OF zcl_15_cargo_plane.
        DATA(weight) = plane->get_total_weight_in_tons( plane->empty_weight_in_tons ).
        IF weight > max_weight.
          max_weight = weight.
          cargo_plane = plane.
        ENDIF.
      ENDIF.
    ENDLOOP.

    resultplane = cargo_plane.
  ENDMETHOD.

  METHOD zif_15_partner~to_string.

  string = 'Ich bin die Fluggesellschaft'.
  ENDMETHOD.

ENDCLASS.
