CLASS zcl_15_abap_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_abap_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

  DATA(result) = zcl_15_helper=>GET_TRAVEL_WITH_CUSTOMER( travel_id = 1 ).
        out->write( result ).




  ENDMETHOD.
ENDCLASS.
