CLASS zcl_15_truck DEFINITION
  PUBLIC
  inheriting from zcl_15_vehicle
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING make          TYPE string
                model         TYPE string
                cargo_in_tons TYPE i.



    DATA cargo_in_tons  TYPE i READ-ONLY.
    DATA is_transformed TYPE c LENGTH 1.

    METHODS to_string REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_truck IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make  = make
                        model = model ).
    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

  METHOD to_string.
    string = super->to_string(  ).
    string &&= |, Frachtkapazität: { cargo_in_tons }t|.
  ENDMETHOD.



ENDCLASS.
