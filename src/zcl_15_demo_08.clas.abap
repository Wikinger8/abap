CLASS zcl_15_demo_08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_demo_08 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " SELECT [Spalten] FROM [Datenbankquelle] WHERE [Bedingung]
    " Lesen von Einzelsätzen
    DATA carrier_id    TYPE /dmo/carrier_id    VALUE 'LH'.
    DATA connection_id TYPE /dmo/connection_id VALUE '0400'.
    DATA connection    TYPE /dmo/connection.

    DATA connections   TYPE TABLE OF /dmo/connection.

    SELECT SINGLE FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @connection.

    out->write( connections ).

    " Lesen mehrerer Datensätze (array fetch)
    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id
      INTO TABLE @connections.

    out->write( connections ).

    " select schleife
    CLEAR connections.
    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id
      INTO @connection.
      APPEND connection TO connections.

    ENDSELECT.

    out->write( connection ).

    " Definition der Zielvariablen (1. inlinedeklaration)
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @DATA(connection2).

    out->write( connection2 ).

    " 2. angabe passender felder
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO CORRESPONDING FIELDS OF @connection.

    out->write( connection ).

    " definition tabellen joins
    SELECT
      FROM /dmo/connection
             INNER JOIN
               /dmo/carrier ON /dmo/connection~carrier_id = /dmo/carrier~carrier_id
      FIELDS /dmo/connection~carrier_id,
             /dmo/connection~connection_id,
             /dmo/carrier~name

      " TODO: variable is assigned but never used (ABAP cleaner)
      INTO TABLE @DATA(connections2).



      connection-connection_id = '6666'.
      insert /dmo/connection from @connection.

      connection-distance = 1.
      connection-distance_unit = 'KM'.



  ENDMETHOD.
ENDCLASS.
