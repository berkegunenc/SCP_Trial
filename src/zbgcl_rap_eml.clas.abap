CLASS zbgcl_rap_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZBGCL_RAP_EML IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    " Step 1 - Read
*    READ ENTITIES OF zbg_i_rap_travel
*        ENTITY Travel
*            FROM VALUE #( ( TravelUUID = 'D5D21800131F0D4B17000B02CFCF0ECB' ) )
*        RESULT DATA(lt_travels).
*
*    out->write( lt_travels ).

*    " Step 2 - Read with Fields
*    READ ENTITIES OF zbg_i_rap_travel
*        ENTITY Travel
*            FIELDS ( AgencyID CustomerID )
*            WITH VALUE #( ( TravelUUID = 'D5D21800131F0D4B17000B02CFCF0ECB' ) )
*        RESULT DATA(lt_travels).
*
*    out->write( lt_travels ).

*    " Step 3 - Read with All Fields
*    READ ENTITIES OF zbg_i_rap_travel
*        ENTITY Travel
*            ALL FIELDS WITH VALUE #( ( TravelUUID = 'D5D21800131F0D4B17000B02CFCF0ECB' ) )
*        RESULT DATA(lt_travels).
*
*    out->write( lt_travels ).

*    " Step 4 - Read by association
*    READ ENTITIES OF zbg_i_rap_travel
*        ENTITY Travel BY \_Booking
*            ALL FIELDS WITH VALUE #( ( TravelUUID = 'D5D21800131F0D4B17000B02CFCF0ECB' ) )
*        RESULT DATA(lt_bookings).
*
*    out->write( lt_bookings ).

*    " Step 5 - Unsuccessful Read
*    READ ENTITIES OF zbg_i_rap_travel
*        ENTITY Travel
*            ALL FIELDS WITH VALUE #( ( TravelUUID = 'D5D21800131F0D4B17000B02CFCF999' ) )
*        RESULT DATA(lt_travels)
*        FAILED DATA(lt_failed)
*        REPORTED DATA(lt_reported).
*
*    out->write( lt_travels ).
*    out->write( lt_failed ).
*    out->write( lt_reported ).

*    " step 6 - MODIFY Update
*    MODIFY ENTITIES OF zbg_i_rap_travel
*      ENTITY travel
*        UPDATE
*          SET FIELDS WITH VALUE
*            #( ( TravelUUID  = 'D5D21800131F0D4B17000B02CFCF0ECB'
*                 Description = 'I like RAP@openSAP' ) )
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    " step 6b - Commit Entities
*    COMMIT ENTITIES
*      RESPONSE OF zbg_i_rap_travel
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Update done' ).

*    " step 7 - MODIFY Create
*    MODIFY ENTITIES OF zbg_i_rap_travel
*      ENTITY travel
*        CREATE
*          SET FIELDS WITH VALUE
*            #( ( %cid        = 'MyContentID_1'
*                 AgencyID    = '70012'
*                 CustomerID  = '14'
*                 BeginDate   = cl_abap_context_info=>get_system_date( )
*                 EndDate     = cl_abap_context_info=>get_system_date( ) + 10
*                 Description = 'I like RAP@openSAP' ) )
*
*     MAPPED DATA(mapped)
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    out->write( mapped-travel ).
*
*    COMMIT ENTITIES
*      RESPONSE OF zbg_i_rap_travel
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Create done' ).

    " step 8 - MODIFY Delete
    MODIFY ENTITIES OF zbg_i_rap_travel
      ENTITY travel
        DELETE FROM
          VALUE
            #( ( TravelUUID  = '02ED5684F31E1EDB87C361316BB3DDF2' ) )

     FAILED DATA(failed)
     REPORTED DATA(reported).

    COMMIT ENTITIES
      RESPONSE OF zbg_i_rap_travel
      FAILED     DATA(failed_commit)
      REPORTED   DATA(reported_commit).

    out->write( 'Delete done' ).

  ENDMETHOD.
ENDCLASS.
