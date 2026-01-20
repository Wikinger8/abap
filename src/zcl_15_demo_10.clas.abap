CLASS zcl_15_demo_10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_demo_10 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT
      FROM Z15_Demo02
      FIELDS CarrierId, ConnectionId, \_Carrier-name
          " WHERE CarrierId = 'LH'
      INTO TABLE @DATA(connections).

    out->write( connections ).




  ENDMETHOD.
ENDCLASS.
