component singleton extends="testboxUtils.models.baseHelper" {

    
    /**
     * Takes an ColdBox event and returns the RC scope from it
     * 
     * @event The ColdBox Event
     * 
     * @return The RC scope
     * @throws TestBoxUtils-EventException if the event is not a ColdBox event
     */
    function getRC( event ){
        try{
            return event.getCollection();
        }catch(e){
            throw( type="TestBoxUtils-EventException", message="The event does not have a collection scope.  Are you sure this is a ColdBox event?" );
        }
    }

    /**
     * Takes an ColdBox event and returns the PRC scope from it
     * 
     * @event The ColdBox Event
     * 
     * @return The PRC scope
     * @throws TestBoxUtils-EventException if the event is not a ColdBox event
     */
    function getPRC( event ){
        try{
            return event.getPrivateCollection();
        }catch(e){
            throw( type="TestBoxUtils-EventException", message="The event does not have a collection scope.  Are you sure this is a ColdBox event?" );
        }
    }
   
}