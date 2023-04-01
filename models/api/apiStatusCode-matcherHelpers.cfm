<cfscript>
    function _statusCodeTest( expectation, args = {} ) {
        // writeDump( "statuscodetest" );
        //  writeDump( arguments );abort;// handle both positional and named arguments
            // arguments.args = arguments.args[ 2 ];
            param args.statusCode = "";
        if ( structKeyExists( args, 1  ) ) {
            // writeDump( args );abort;
            args.statusCode = args[ 1 ];
        }
        param args.message = "Invalid Status Code";
        if ( structKeyExists( args, 2 ) ) {
            args.message = args[ 2 ];
        }
        if ( args.statusCode == "" ) {
            expectation.message = "No status code provided.";
            return false;
        }

        try {
            var statusCode = expectation.actual.getStatusCode();
        }
        catch ( any e ) {
            expectation.message = "[#expecation.actual#] is not a API Response or an Event with an API Response - it does not have a getStatusCode method.";
            return false;
        }

        if ( expectation.isNot ){
            if( statusCode == args.statusCode ) {
                expectation.message = "#args.message#. Received incorrect status code. Expected not to be [#args.statusCode#]. Received [#statusCode#].";
                return false;
            }
        } else {
            if( statusCode != args.statusCode ) {
                expectation.message = "#args.message#. Received incorrect status code. Expected [#args.statusCode#]. Received [#statusCode#].";
                return false;
            }
        }

        return true;
    }
</cfscript>