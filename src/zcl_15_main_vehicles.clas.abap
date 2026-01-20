CLASS zcl_15_main_vehicles DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_main_vehicles IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklarationen
    DATA vehicle  TYPE REF TO zcl_15_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_15_vehicle.

    DATA rental   TYPE REF TO zcl_15_rental.
    DATA carrier  TYPE REF TO zcl_15_carrier.
    DATA partners TYPE TABLE OF REF TO zif_15_partner.

    " Instanzziierungen

    out->write( zcl_15_vehicle=>number_of_vehicles ).

    vehicle = NEW zcl_15_car( make  = 'Porschcare'
                              model = '911'
                              seats = 2 ). " upcast

    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_15_truck( make          = 'Porstruckhe'
                                model         = '911'
                                cargo_in_tons = 2 ). " upcast

    APPEND vehicle TO vehicles.

    " vehicle = new #( make = 'Porsche' model = '911' ).
    APPEND vehicle TO vehicles.

    " vehicle = new #( make = 'Porsche' model = '911' ).
    APPEND vehicle TO vehicles.

    rental = NEW #( ).
    carrier = NEW #( 'Lufthansa' ).
    APPEND rental TO partners. " upcast
    APPEND carrier TO partners.

    " Ausgabe

    LOOP AT vehicles INTO vehicle.
      TRY.
          vehicle->accelerate( 30 ).
          vehicle->brake( 10 ).
          vehicle->accelerate( 30 ).
        CATCH zcx_15_value_too_high INTO DATA(x).
          out->write( x->get_text( ) ).
      ENDTRY.
      " out->write( |{ vehicle->make } { vehicle->model }| ).
      out->write( vehicle->to_string( ) ).

    ENDLOOP.
    LOOP AT partners INTO DATA(partner).
      out->write( partner->to_string( ) ).

      IF partner IS INSTANCE OF zcl_15_carrier.
        carrier = CAST #( partner ). " downcast

        out->write( carrier->get_biggest_cargo_plane( ) ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
