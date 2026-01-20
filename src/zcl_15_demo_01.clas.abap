CLASS zcl_15_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_demo_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " ---------------------------------------------------------------------
    " Hello World
    " ---------------------------------------------------------------------

    DATA text TYPE string. " Deklaration

    text = 'Hello World'. " Wertzuweisung

    " Ausgabe

    " ---------------------------------------------------------------------
    " Datentypen
    " ---------------------------------------------------------------------

    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA age                  TYPE i.                      " Ganze Zahlen
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA salary_in_euro       TYPE p LENGTH 16 DECIMALS 2. " Kommazahlen (2 Nachkommastellen 29 Vorkommastellen)
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA first_name           TYPE c LENGTH 40.            " Zeichenkettn fester Länge
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA matriculation_number TYPE n LENGTH 7.             " Ziffernfolge
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA tower                TYPE d.                      " Datum
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA incident             TYPE t.                      " Zeit
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA flag                 TYPE c LENGTH 1.             " Boolean (wahr/falsch)

    " ---------------------------------------------------------------------
    " Wertzuweisung
    " ---------------------------------------------------------------------

    age = 44.
    salary_in_euro = '6000.52'.
    first_name = 'Emanuel'.
    DATA last_name TYPE c LENGTH 40.
    last_name = 'Schuessler'.
    matriculation_number = '98534'.
    tower = '20010911'.
    incident = '084640'.
    flag = 'X'.

    out->write( |Hello { first_name } { last_name }, how are you?| ).

    " Initialisierung
    age = 0.
    flag = ' '.
    flag = ''.
    CLEAR flag.

    " Statische Vorbelegung

    " Inlinedeklaration
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA(size_in_cm) = 179.
    size_in_cm = '179'.

    DATA person TYPE /dmo/customer.

    DATA customer_id2 TYPE /dmo/customer_id.

    person-customer_id        = '19286'.
    person-first_name = 'Bruce'.
    person-last_name  = 'Wayne'.
    person-city      = 'Gotham City'.
    person-country_code   = 'US'.

    out->write( |{ person-customer_id }, { person-first_name } { person-last_name }| ).
    " out->write( person ).


    DATA result_i TYPE i.

    DATA result_p TYPE p DECIMALS 3.
    "mathematische Operatoren
    result_i = 5 + 3.
    out->write( result_i ).
    result_i = 5 - 3.
    out->write( result_i ).
    result_i = 5 * 3.

    out->write( result_i ).
    result_p = 5 / 3.
    out->write( result_p ).

    result_i = 5 DIV 3.
    out->write( result_i ).

    result_i = 5 MOD 3.
    out->write( result_i ).

    result_i = 5 ** 3.
    out->write( result_i ).

    result_i = result_i + 1.
    result_i += 1.
    "result_i++.


    " Numerische Funktionen
    result_i = sqrt( 81 ).
    out->write( result_i ).

    out->write( round( val = '47.895' dec = 2 ) ).










    DATA op1 TYPE p DECIMALS 2 VALUE '2'.
    DATA op2 TYPE p DECIMALS 2 VALUE '3.05'.
    DATA op TYPE c LENGTH 40.
    op = '**'.

    DATA result TYPE p DECIMALS 2.

    IF op = '**'.
     "     result = zcl_15_calculator=>divide( base = op1 exponent = CONV i( op2 ) ).

      out->write( |{ op1 NUMBER = USER } { op } { CONV i( op2 ) } = { result NUMBER = USER }| ).

    ELSE.
      result = SWITCH #( op
    WHEN '+'  THEN op1 + op2
    WHEN '-'  THEN op1 - op2
    WHEN '*'  THEN op1 * op2
    WHEN '/'  THEN op1 / op2
    WHEN '%'  THEN zcl_15_calculator=>calculate_percentage( base = op1 percentage = op2 )
    ELSE 0
  ).
out->write( |{ op1 NUMBER = USER } { op } { op2 NUMBER = USER } = { result NUMBER = USER }| ).

    ENDIF.











  ENDMETHOD.

ENDCLASS.
