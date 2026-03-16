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



ENDCLASS.


CLASS lcl_connection IMPLEMENTATION.

  METHOD class_constructor.

  ENDMETHOD.

  METHOD constructor.

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

    APPEND | --------------------- | TO r_output.
    APPEND | Carrier : {  carries_id }  | TO  r_output.
    APPEND | Connection : {  connection_id }  | TO  r_output.

  ENDMETHOD.


ENDCLASS.
