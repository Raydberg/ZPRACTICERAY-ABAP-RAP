*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations


CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.

    CLASS-DATA conn_counter TYPE i READ-ONLY.
    CLASS-DATA n_o_connections TYPE i.
    CLASS-METHODS class_constructor.

    METHODS set_attributes
      IMPORTING
        i_carrier_id    TYPE /dmo/carrier_id OPTIONAL
        i_connection_id TYPE /dmo/connection_id
      RAISING
        cx_abap_invalid_value.


    METHODS get_attributes
      EXPORTING
        e_carrier_id    TYPE /dmo/carrier_id
        e_connection_id TYPE /dmo/connection_id.


    METHODS constructor
      IMPORTING
        i_carries_id    TYPE /dmo/carrier_id
        i_connection_id TYPE /dmo/connection_id.



    METHODS get_output
      RETURNING VALUE(r_output) TYPE string_table.


  PRIVATE SECTION.
    DATA carries_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id TYPE /dmo/airport_to_id.
    DATA carrier_name TYPE /dmo/carrier_name.



ENDCLASS.


CLASS lcl_connection IMPLEMENTATION.

  METHOD class_constructor.

  ENDMETHOD.

  METHOD constructor.

*    IF i_carries_id IS INITIAL OR i_connection_id IS INITIAL.
*      RAISE EXCEPTION TYPE cx_abap_invalid_value.
*    ENDIF.

*    SELECT SINGLE
*    FROM /dmo/connection
*    FIELDS airport_from_id , airport_to_id
*    WHERE carrier_id = @i_carries_id
*    AND connection_id = @i_connection_id
*    INTO ( @airport_from_id, @airport_to_id ).

    SELECT SINGLE
    FROM /DMO/I_Connection
    FIELDS DepartureAirport , DestinationAirport, \_Airline-Name
    WHERE AirlineID = @i_carries_id
    AND ConnectionID = @i_connection_id
    INTO ( @airport_from_id, @airport_to_id , @carrier_name ).


    IF sy-subrc <> 0.
      TRY.
          RAISE EXCEPTION TYPE cx_abap_invalid_value.
        CATCH cx_abap_invalid_value.
          "handle exception
      ENDTRY.
    ENDIF.

    me->carries_id = i_carries_id.
    me->connection_id = i_connection_id.
    conn_counter = conn_counter + 1.

  ENDMETHOD.

  METHOD set_attributes.

*    IF carries_id IS INITIAL OR connection_id IS INITIAL.
*      RAISE EXCEPTION TYPE cx_abap_invalid_value.
*    ENDIF.

    carries_id = i_carrier_id.
    connection_id = i_connection_id.
    n_o_connections = n_o_connections + 1.
  ENDMETHOD.


  METHOD get_attributes.
    e_carrier_id = carries_id .
    e_connection_id = carries_id .

  ENDMETHOD.


  METHOD get_output.


    APPEND |--------------------------------|             TO r_output.
    APPEND |Carrier:     { carries_id     }|             TO r_output.
    APPEND |Connection:  { connection_id   }|             TO r_output.
    APPEND |Departure:   { airport_from_id }|             TO r_output.
    APPEND |Destination: { airport_to_id   }|             TO r_output.
    APPEND |Carrier:     { carries_id } { carrier_name }| TO r_output.



  ENDMETHOD.


ENDCLASS.
