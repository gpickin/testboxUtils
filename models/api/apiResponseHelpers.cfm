<cfscript>

    var helpers = {
        getAPIResponse: function( actual ){
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

</cfscript>