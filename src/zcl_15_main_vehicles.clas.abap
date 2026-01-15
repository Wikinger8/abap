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
  data vehicle type ref to zcl_15_vehicle.
  data vehicles type table of ref to zcl_15_vehicle.

  " Instanzziierungen

    out->write( zcl_15_vehicle=>number_of_vehicles ).

  vehicle = new #( make = 'Porsche' model = '911' ).



  append vehicle to vehicles.

   vehicle = new #( make = 'Porsche' model = '911' ).
  append vehicle to vehicles.

  vehicle = new #( make = 'Porsche' model = '911' ).
  append vehicle to vehicles.


  LOOP at vehicles into vehicle.
  try.
  vehicle->accelerate( 30 ).
  vehicle->brake( 10 ).
  vehicle->accelerate( 3030 ).
  catch zcx_15_value_too_high into data(x).
  out->write( x->get_text( ) ).
  endtry.
  out->write( |{ vehicle->make } { vehicle->model }| ).

  endloop.



  ENDMETHOD.
ENDCLASS.
