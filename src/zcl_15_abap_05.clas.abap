CLASS zcl_15_abap_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_abap_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA customer TYPE z15_customer_info.

    TRY.
        customer = zcl_abap_helper=>get_customer( 000001 ).
      CATCH zcx_abap_no_data INTO DATA(x).
        customer = 0.
    ENDTRY.

    out->write( customer ).






  ENDMETHOD.
ENDCLASS.
