CLASS zcl_15_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  CLASS-METHODS GET_TRAVEL_WITH_CUSTOMER
      IMPORTING
                TRAVEL_ID      TYPE /DMO/TRAVEL_ID
      RETURNING VALUE(TRAVEL_WITH_CUSTOMER) TYPE ZABAP_TRAVEL_WITH_CUSTOMER.

CLASS-METHODS GET_TRAVELS
      IMPORTING
                CUSTOMER_ID      TYPE /DMO/CUSTOMER_ID
      RETURNING VALUE(TRAVELS) TYPE Z15_TRAVELS.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_15_helper IMPLEMENTATION.

METHOD GET_TRAVEL_WITH_CUSTOMER.

SELECT SINGLE
  FROM /dmo/travel
  INNER JOIN /dmo/customer on /dmo/travel~customer_id = /dmo/customer~customer_id
  fields *
  WHERE travel_id = @travel_id
  INTO CORRESPONDING FIELDS OF @travel_with_customer.


  ENDMETHOD.

  METHOD get_travels.
    SELECT * FROM /dmo/travel
      WHERE customer_id = @customer_id
      INTO TABLE @travels.

    if sy-subrc <> 0.
      TRY.
          RAISE EXCEPTION NEW zcx_abap_no_data( field = 'CUSTOMER_ID'
                                                table = '/DMO/TRAVEL'
                                                value = CONV #( customer_id ) ).
        CATCH zcx_abap_no_data.
          "handle exception
      ENDTRY.
    ENDIF.





  ENDMETHOD.
ENDCLASS.
