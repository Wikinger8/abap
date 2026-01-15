CLASS zcl_15_demo_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_15_demo_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklaration interner Tabellen
    DATA connections TYPE z15_connections. " TYPE [Tabellentyp]

    DATA connection  TYPE z15_connection.

    " Hinzufügen von Datensätzen
    connections = VALUE #( ( carrier_id = 'LH' connection_id = '0400' )
                           ( carrier_id = 'UA' airport_from_id = 'FRA' )
                           ( connection_id = '0401' airport_to_id = 'FRA' ) ).

    " Anfügen von Datensätzen
    connection = VALUE #( carrier_id      = 'AZ'
                          connection_id   = '0017'
                          airport_from_id = 'BER'
                          airport_to_id   = 'ROM' ).

    connections = VALUE #( BASE connections
                           ( connection ) ).

    " Lesen von Datensätzen
    TRY.
        connection = connections[ 2 ]. " per Index
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '9999' ] ).
      TRY.
          connection = connections[ connection_id = '9999' ]. " per Schlüssel
        CATCH cx_sy_itab_line_not_found.
      ENDTRY.
    ENDIF.

    LOOP AT connections INTO connection WHERE carrier_id IS NOT INITIAL. " into DATA(connection2)
      out->write( |{ sy-tabix } { connection-carrier_id }| ).
    ENDLOOP.

    " Ändern von Datensätzen
    TRY.
        connections[ 1 ]-airport_from_id = 'FRA'. " per Index
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0400' ] ).
      TRY.
          connections[ connection_id = '9999' ]-connection_id = '0402'. " per Schlüssel
        CATCH cx_sy_itab_line_not_found.
      ENDTRY.
    ENDIF.

    " Ändern per sy-tabix
    LOOP AT connections INTO connection WHERE carrier_id IS NOT INITIAL. " into DATA(connection2)
      " connection-airport_to_id = 'JFK'. (nicht funktionabel)
      connections[ sy-tabix ]-airport_to_id = 'JFK'.
    ENDLOOP.

    " per Datenreferenz (where carrier_id is not initial. wurde zur Übersicht weggelassen)
    DATA connection2 TYPE REF TO z15_connection.
    LOOP AT connections REFERENCE INTO connection2. " into DATA(connection2)
      connection2->airport_to_id = 'BER'.
    ENDLOOP.

    " per Feldsymbol
    FIELD-SYMBOLS <connection> TYPE z15_connection.
    LOOP AT connections ASSIGNING <connection>. " into DATA(connection2)
      <connection>-carrier_id = 'LH'.
    ENDLOOP.

    " Sortieren
    SORT connections BY carrier_id DESCENDING connection_id ASCENDING.

    " Löschen
    DELETE connections WHERE airport_from_id = 'FRA'.

    " Anzahl Datensätze
    out->write( lines( connections ) ).

    " Ausgabe
    out->write( connections ).




  ENDMETHOD.
ENDCLASS.
