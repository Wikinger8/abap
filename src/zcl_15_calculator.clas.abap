CLASS zcl_15_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS divide
      IMPORTING
                operand1      TYPE z15_decimal
                operand2      TYPE z15_decimal
      RETURNING VALUE(result) TYPE z15_decimal
      RAISING   cx_sy_zerodivide.

    CLASS-METHODS calculate_percentage
      IMPORTING
                PERCENTAGE      TYPE z15_decimal
                BASE      TYPE z15_decimal
      RETURNING VALUE(PERCENTAGE_VALUE) TYPE z15_decimal.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_calculator IMPLEMENTATION.
  METHOD divide.
    " Eingabeprüfung
    IF operand2 IS INITIAL.
      RAISE EXCEPTION TYPE cx_sy_zerodivide.
    ENDIF.

    result = operand1 / operand2.

  ENDMETHOD.

  METHOD calculate_percentage.

PERCENTAGE_VALUE = BASE * ( Percentage / 100 ).

  ENDMETHOD.

ENDCLASS.
