CLASS zcl_15_passenger_plane DEFINITION
  PUBLIC
  inheriting from zcl_15_airplane
  FINAL
  CREATE PUBLIC .




  PUBLIC SECTION.


  methods GET_TOTAL_WEIGHT_IN_TONS REDEFINITION.
  METHODS constructor
    IMPORTING
      id TYPE string
      plane_type TYPE string
      empty_weight_in_tons TYPE i
      number_of_seats TYPE i
    RAISING
      zcx_abap_initial_parameter.


  DATA number_of_seats type i READ-ONLY.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_passenger_plane IMPLEMENTATION.

  METHOD constructor.

    super->constructor( id = id plane_type = plane_type empty_weight_in_tons = empty_weight_in_tons ).

    me->number_of_seats = number_of_seats.
    me->id = id.
    me->plane_type = plane_type.
    me->empty_weight_in_tons = empty_weight_in_tons.

  ENDMETHOD.
  METHOD get_total_weight_in_tons.
weight = emptyweight * '1.1' + number_of_seats * '0.08'.
  ENDMETHOD.

ENDCLASS.
