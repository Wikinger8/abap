CLASS zcl_15_abap_cds_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_abap_cds_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
SELECT
      FROM Z15_CustomerWithTravels
      FIELDS FirstName, LastName, \_Travels-Description, \_Travels-BeginDate
          " WHERE CarrierId = 'LH'
      INTO TABLE @DATA(customers).

    out->write( customers ).


  ENDMETHOD.
ENDCLASS.
