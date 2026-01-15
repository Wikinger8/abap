CLASS zcl_15_abap_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_abap_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(result) = zcl_15_helper=>get_travels( customer_id = 000594 ).

    DELETE result WHERE begin_date < '20260114'.

    FIELD-SYMBOLS <travels> TYPE /dmo/travel.
    LOOP AT result ASSIGNING <travels>.
      <travels>-booking_fee *= '1.1'.
    ENDLOOP.

    sort result by description DESCENDING.

    out->write( result ).
  ENDMETHOD.
ENDCLASS.
