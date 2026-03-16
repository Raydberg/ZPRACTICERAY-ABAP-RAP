CLASS zcl_atributos_oop DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

*    METHODS:


*  PROTECTED SECTION.
*    DATA:
*      id          TYPE i,
*      name(20)    TYPE c,
*      description TYPE c LENGTH 16.

  PRIVATE SECTION.
    DATA log TYPE REF TO if_oo_adt_classrun_out.

ENDCLASS.



CLASS zcl_atributos_oop IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.



    TRY.
        connection = NEW #( i_carries_id = 'L1'
                            i_connection_id = '0400'
                             ).

      CATCH cx_abap_invalid_value.
        out->write( 'Method call failed' ).
    ENDTRY.

    APPEND connection TO connections.



    TRY.
*        connection->set_attributes(
*        EXPORTING
*          i_carrier_id = 'LH'
*          i_connection_id = '0500'
*        ).
        connection = NEW #(
                  i_carries_id = 'LH'
             i_connection_id = '0500'
            ).

      CATCH cx_abap_invalid_value.
        out->write( 'Method call failed' ).
    ENDTRY.

    APPEND connection TO connections.


** Se reemplaza por el FUNCIONAL METHOD -> OUTPUT METHOD
*    LOOP AT connections INTO connection.
*
**      connection->get_attributes(
**        e_carrier_id    = carrier_id
**        e_connection_id = connection_id
**      ).
*      connection->get_attributes(
**      Importing lo que va a salir del metodo
*          IMPORTING
*              e_carrier_id    = carrier_id
*              e_connection_id = connection_id
*       ).
*
*    ENDLOOP.

    DATA(result) = connection->get_output(  ).

    IF connection->get_output(  ) IS NOT INITIAL.

      LOOP AT connections INTO connection.
*      out->write(
**      EXPORTING
*          data   = connection->get_output(  )
*          name   = `Salida de resultado`
*      ).

        out->write( connection->get_output(  ) ).

      ENDLOOP.


    ENDIF.


  ENDMETHOD.



ENDCLASS.



