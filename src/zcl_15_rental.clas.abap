CLASS zcl_15_rental DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  interfaces zif_15_partner.

    TYPES ty_vehicles TYPE TABLE OF REF TO zcl_15_vehicle.

    DATA vehicles TYPE ty_vehicles READ-ONLY.

    METHODS add_vehicle
      IMPORTING vehicle TYPE REF TO zcl_15_vehicle.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_rental IMPLEMENTATION.
  METHOD add_vehicle.
    APPEND vehicle TO vehicles.
  ENDMETHOD.

  METHOD zif_15_partner~to_string.
  string = 'Ich bin die Autovermietung'.
  ENDMETHOD.

ENDCLASS.
