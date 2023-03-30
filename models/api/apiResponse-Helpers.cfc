component singleton extends="testboxUtils.models.baseHelper" {

    // TOOD: To Implement
    // - getApiResponse( event )  or event.getApiResponse
    // - getApiData( Event|APIResponse )
    // - getApiError( eventt|APIResponse )
    // - getApiMessages( eventt|APIResponse )
    // - getApiPagination( eventt|APIResponse )
    // - getAPI( eventt|APIResponse, “KeyName” )
    
    /**
     * getAPIResponse - Returns the API response from an event, or json
     * 
     * @actual The event or json to get the response from
     * 
     * @return APIResponse Struct
     * @throws UnknownAPIResponse if an API Response cannot be found given the input
     */
    function getAPIResponse( actual ){
        if( isStruct( actual ) ){
            if( structKeyExists( actual, "getRenderedContent" ) && isCustomFunction( actual.getRenderedContent ) ){
                var renderedContent = actual.getRenderedContent();
                if( isJSON( renderedContent ) ){
                    return deserializeJSON( renderedContent );
                }
            } else {
                return actual;
            }
        } 
        if( isJSON( actual ) ){
            return deserializeJSON( actual );
        }
        throw( type="UnknownAPIResponse", message="Unknown API Response" );
    }
    
}