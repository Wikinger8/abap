CLASS zcl_15_airplane DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING !id                  TYPE string
                                  plane_type           TYPE string
                                  empty_weight_in_tons TYPE i
                        RAISING   zcx_abap_initial_parameter.

    METHODS get_total_weight_in_tons
      IMPORTING emptyweight        TYPE i
      RETURNING VALUE(weight) TYPE i.

    DATA id                   TYPE string READ-ONLY.
    DATA plane_type           TYPE string READ-ONLY.
    DATA empty_weight_in_tons TYPE i      READ-ONLY.

    CLASS-DATA number_of_airplanes TYPE i READ-ONLY.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_15_airplane IMPLEMENTATION.


  method constructor.

if empty_weight_in_tons is initial.
    RAISE EXCEPTION NEW ZCX_ABAP_INITIAL_PARAMETER( id ).
    endif.
    me->id = !id.

    if empty_weight_in_tons is initial.
    RAISE EXCEPTION NEW ZCX_ABAP_INITIAL_PARAMETER( plane_type ).
    endif.
    me->plane_type = plane_type.

    if empty_weight_in_tons is initial.
    RAISE EXCEPTION NEW ZCX_ABAP_INITIAL_PARAMETER( |{ empty_weight_in_tons }| ).
    endif.

    me->empty_weight_in_tons = empty_weight_in_tons.


    number_of_airplanes += 1.
  endmethod.

  METHOD get_total_weight_in_tons.
weight = emptyweight * '1.1'.
  ENDMETHOD.

ENDCLASS.
