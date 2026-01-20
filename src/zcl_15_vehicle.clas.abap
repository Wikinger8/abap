CLASS zcl_15_vehicle DEFINITION
  public abstract

  CREATE PUBLIC .

  PUBLIC SECTION.


    " METHODS set_make  IMPORTING make TYPE string.
    " METHODS set_model        IMPORTING model           TYPE string.

    METHODS constructor IMPORTING make  TYPE string
                                  model TYPE string.

    METHODS accelerate IMPORTING !value TYPE i
                       RAISING   zcx_15_value_too_high.

    METHODS brake IMPORTING !value TYPE i
                  RAISING   zcx_15_value_too_high.

    METHODS to_string abstract RETURNING VALUE(string) TYPE string.

    DATA make         TYPE string READ-ONLY.
    DATA model        TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i      READ-ONLY.

    CLASS-DATA number_of_vehicles TYPE i READ-ONLY.

PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_15_vehicle IMPLEMENTATION.
  METHOD accelerate.
    IF speed_in_kmh + value > 300.
      RAISE EXCEPTION NEW zcx_15_value_too_high( value ).
    ENDIF.
    speed_in_kmh += value.
  ENDMETHOD.

  METHOD brake.
    IF value > speed_in_kmh.
      RAISE EXCEPTION NEW zcx_15_value_too_high( value ).
    ENDIF.
    speed_in_kmh -= value.
  ENDMETHOD.

  METHOD constructor.
    me->make  = make.
    me->model = model.
    speed_in_kmh = speed_in_kmh.

    number_of_vehicles += 1.
  ENDMETHOD.

ENDCLASS.
