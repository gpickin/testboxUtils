<cfscript>

    // Helpers struct to help pass functions through dynamic inclusion framework
    var helpers = {};
    // Sample helper function
    // xxxxx = function( expectation, args = { } ) {};
    // Add sample function to helpers
    // helpers[ "xxxxx" ] = xxxx;

    /**
     * Takes an ColdBox event and returns the RC scope from it
     * 
     * @event The ColdBox Event
     * 
     * @return The RC scope
     * @throws TestBoxUtils-EventException if the event is not a ColdBox event
     */
    getRC= function( event ){
        try{
            return event.getCollection();
        }catch(e){
            throw( type="TestBoxUtils-EventException", message="The event does not have a collection scope.  Are you sure this is a ColdBox event?" );
        }
    }
    helpers[ "getRC" ] = getRC;

    /**
     * Takes an ColdBox event and returns the PRC scope from it
     * 
     * @event The ColdBox Event
     * 
     * @return The PRC scope
     * @throws TestBoxUtils-EventException if the event is not a ColdBox event
     */
    getPRC= function( event ){
        try{
            return event.getPrivateCollection();
        }catch(e){
            throw( type="TestBoxUtils-EventException", message="The event does not have a collection scope.  Are you sure this is a ColdBox event?" );
        }
    }
    helpers[ "getPRC" ] = getPRC;
    
</cfscript>