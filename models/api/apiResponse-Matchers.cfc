component singleton extends="testboxUtils.models.baseMatcher" {

    // TODO: TO BE IMPLEMENTED
    // - ToHaveAPIErrorWithMessage( “partial message”, type="complete|regex|contains|startsWith|endWith" ) //position=any
    // - toHaveAPIResponseWithOneMessage()
    // - toHaveAPIResponseWithSomeMessages()
    // - toHaveAPIResponseWithNoMessages()
    // - toHaveAPIResponseWithMessagesCount( "number")
    // - toHaveAPIResponseWithMessagesCount( "!=", "number")
    // - expect( getAPIResponseMessages() ).toHaveLengthGTE( 1 )
    // - ToHaveAPIResponseWithMessagesCountGt()
    // - ToHaveAPIResponseWithMessagesCountGte()
    // - ToHaveAPIResponseWithMessagesCountLt()
    // - ToHaveAPIResponseWithMessagesCountLte()
    // - ToHaveAPIResponseWithDataEmptyString()
    // - ToHaveAPIResponseWithDataString()
    // - ToHaveAPIResponseWithDataNumber()
    // - ToHaveAPIResponseWithDataArray()
    // - ToHaveAPIResponseWithDataArrayCount()
    // - ToHaveAPIResponseWithDataArrayCountGt()
    // - ToHaveAPIResponseWithDataArrayCountGte()
    // - ToHaveAPIResponseWithDataArrayCountLt()
    // - ToHaveAPIResponseWithDataArrayCountLte()
    // - ToHaveAPIResponseWithDataStruct()
    // - ToHaveAPIResponseWithDataEmptyString()

    helpers = new "apiResponse-helpers"( );

    function toHaveAPIResponse( expectation, args = {} ) {
        try {
            var apiResponse = helpers.getAPIResponse( expectation.actual );
        } catch ( any e ) {
            expectation.message = "Item passed may not be JSON, API Response Struct, or Event";
            return false;
        }
        var isValidAPIResponse = true;
        if ( !isStruct( apiResponse ) ) {
            expectation.message = "The apiResponse is not a struct";
            return false;
        }
        if ( !toHaveKeyWithCase( expectation, apiResponse, { key: "data" } ) ) {
            return false;
        }
        if ( !toHaveKeyWithCase( expectation, apiResponse, { key: "error" } ) ) {
            return false;
        }
        if ( !isBoolean( apiResponse.error ) ) {
            expectation.message = "The error key must be a boolean value";
            return false;
        }
        if ( !toHaveKeyWithCase( expectation, apiResponse, { key: "messages" } ) ) {
            return false;
        }
        if ( !isArray( apiResponse.messages ) ) {
            expectation.message = "The messages key is not an array";
            return false;
        }
        if ( !toHaveKeyWithCase( expectation, apiResponse, { key: "pagination" } ) ) {
            return false;
        }
        if ( !isStruct( apiResponse.pagination ) ) {
            expectation.message = "The pagination key is not a struct";
            return false;
        }
        if ( !toHaveKeyWithCase( expectation, apiResponse.pagination, { key: "totalPages" } ) ) {
            return false;
        }
        if ( !isNumeric( apiResponse.pagination.totalPages ) ) {
            expectation.message = "The pagination.totalPages key is not an numeric";
            return false;
        }
        if ( !toHaveKeyWithCase( expectation, apiResponse.pagination, { key: "maxRows" } ) ) {
            return false;
        }
        if ( !isNumeric( apiResponse.pagination.maxRows ) ) {
            expectation.message = "The pagination.maxRows key is not numeric";
            return false;
        }
        if ( !toHaveKeyWithCase( expectation, apiResponse.pagination, { key: "offset" } ) ) {
            return false;
        }
        if ( !isNumeric( apiResponse.pagination.offset ) ) {
            expectation.message = "The pagination.offset key is not an numeric";
            return false;
        }
        if ( !toHaveKeyWithCase( expectation, apiResponse.pagination, { key: "page" } ) ) {
            return false;
        }
        if ( !isNumeric( apiResponse.pagination.page ) ) {
            expectation.message = "The pagination.page key is not an numeric";
            return false;
        }
        if ( !toHaveKeyWithCase( expectation, apiResponse.pagination, { key: "totalRecords" } ) ) {
            return false;
        }
        if ( !isNumeric( apiResponse.pagination.totalRecords ) ) {
            expectation.message = "The pagination.totalRecords key is not an numeric";
            return false;
        }
        return true;
    }

    function toHaveAPIError( expectation, args = {} ) {
        try {
            var apiResponse = helpers.getAPIResponse( expectation.actual );
        } catch ( any e ) {
            expectation.message = "Item passed may not be JSON, API Response Struct, or Event";
            return false;
        }
        if ( !toHaveAPIResponse( expectation, { "getAPIResponse": apiResponse } ) ) {
            return false;
        }
        if ( expectation.isNot ) {
            if ( apiResponse.error ) {
                expectation.message = "The API Response is an error when you expected it not to be an error.";
                return false;
            }
            return true;
        } else {
            if ( !apiResponse.error ) {
                expectation.message = "The API Response is not an error";
                return false;
            }
            return true;
        }
    };

    function toHaveAPIErrorWithMessage( expectation, args = {} ) {
        param args.expectedMessage = "";
        if ( structKeyExists( args, 1 ) ) {
            args.expectedMessage = args[ 1 ];
        }

        try {
            var apiResponse = helpers.getAPIResponse( expectation.actual );
        } catch ( any e ) {
            expectation.message = "Item passed may not be JSON, API Response Struct, or Event";
            return false;
        }
        if ( !toHaveAPIResponse( expectation, { "getAPIResponse": apiResponse } ) ) {
            return false;
        }
        if ( expectation.isNot ) {
            if ( apiResponse.error ) {
                expectation.message = "The API Response is an error when you expected it not to be an error.";
                return false;
            }
        } else {
            if ( !apiResponse.error ) {
                expectation.message = "The API Response is not an error";
                return false;
            }
        }
        if ( expectation.isNot ) {
            if ( arrayFind( apiResponse.messages, args.expectedMessage ) ) {
                expectation.message = "The API Response contains the message [#args.expectedMessage#] when you expected it not to contain the message.";
                return false;
            }
            return true;
        } else {
            if ( !arrayFind( apiResponse.messages, args.expectedMessage ) ) {
                expectation.message = "The API Response does not contain the message [#args.expectedMessage#]";
                return false;
            }
            return true;
        }
    }

    function toHaveAPISuccessWithMessage( expectation, args = { message: "" } ) {
        param args.expectedMessage = "";
        if ( structKeyExists( args, 1 ) ) {
            args.expectedMessage = args[ 1 ];
        }

        try {
            var apiResponse = helpers.getAPIResponse( expectation.actual );
        } catch ( any e ) {
            expectation.message = "Item passed may not be JSON, API Response Struct, or Event";
            return false;
        }
        if ( !toHaveAPIResponse( expectation, { "getAPIResponse": apiResponse } ) ) {
            return false;
        }
        if ( expectation.isNot ) {
            if ( !apiResponse.error ) {
                expectation.message = "The API Response is a success when you expected it not to be a success.";
                return false;
            }
        } else {
            if ( apiResponse.error ) {
                expectation.message = "The API Response is not a success";
                return false;
            }
        }
        if ( expectation.isNot ) {
            if ( arrayFind( apiResponse.messages, args.expectedMessage ) ) {
                expectation.message = "The API Response contains the message [#args.expectedMessage#] when you expected it not to contain the message.";
                return false;
            }
            return true;
        } else {
            if ( !arrayFind( apiResponse.messages, args.expectedMessage ) ) {
                expectation.message = "The API Response does not contain the message [#args.expectedMessage#]";
                return false;
            }
            return true;
        }
    }

    /**
     * Private helper function
     */
    private function toHaveKeyWithCase( expectation, subActual, args = {} ) {
        if ( !listFind( subActual.keyList(), args.key ) ) {
            if ( listFindNoCase( subActual.keyList(), args.key ) ) {
                expectation.message = "The key(s) [#args.key#] does exist in the target object, but the Case is incorrect. Found keys are [#structKeyArray( subActual ).toString()#]";
            } else {
                expectation.message = "The key(s) [#args.key#] does not exist in the target object, with or without case sensitivity. Found keys are [#structKeyArray( subActual ).toString()#]";
            }
            return false;
        }
        return true;
    }

}
