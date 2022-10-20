<cfscript>

    // Helpers struct to help pass functions through dynamic inclusion framework
    var helpers = {};
    // Sample helper function
    // xxxxx = function( expectation, args = { } ) {};
    // Add sample function to helpers
    // helpers[ "xxxxx" ] = xxxx;
    
    
    /**
     * getAPIResponse - Returns the API response from an event, or json
     * 
     * @input The event or json to get the response from
     * 
     * @return APIResponse Object
     * @throws UnknownAPIResponse if an API Response cannot be found given the input
     */
    getAPIResponse = function( actual ){
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
    helpers[ "getAPIResponse" ] = getAPIResponse;

</cfscript>