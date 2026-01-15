CLASS zcl_15_main_airplanes DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA airplane  TYPE REF TO zcl_15_airplane.
    DATA airplanes TYPE TABLE OF REF TO zcl_15_airplane.

    " Instanzziierungen
    TRY.
        airplane = NEW #( id                   = 'Porsche'
                          plane_type           = '911'
                          empty_weight_in_tons = '9' ).
        APPEND airplane TO airplanes.
      CATCH zcx_abap_initial_parameter.
    ENDTRY.

    TRY.
        airplane = NEW #( id                   = 'Porsssssssche'
                          plane_type           = '91333331'
                          empty_weight_in_tons = '19' ).
        APPEND airplane TO airplanes.

      CATCH zcx_abap_initial_parameter.
    ENDTRY.

    TRY.

        airplane = NEW #( id                   = 'Porfffffffsche'
                          plane_type           = '91222221'
                          empty_weight_in_tons = '92' ).
        APPEND airplane TO airplanes.

      CATCH zcx_abap_initial_parameter.
    ENDTRY.
    LOOP AT airplanes INTO airplane.
      out->write( |{ airplane->id } { airplane->plane_type } { airplane->empty_weight_in_tons }| ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
