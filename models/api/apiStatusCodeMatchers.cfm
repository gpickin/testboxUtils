<cfscript>
    
	include "apiStatusCodeHelpers.cfm";

    var matchers = {};
    // Sample matcher function
    // xxxxx = function( expectation, args = { } ) {};
    // Add sample function to matchers
    // matchers[ "xxxxx" ] = xxxx;

    // Add your matchers here
    
	toHaveStatusCode= function( expectation, args = {} ) {
		// writeDump( serializeJSON( arguments.args ) );abort;
		return statusCodeTest( argumentCollection = arguments );
	};
	matchers[ "toHaveStatusCode" ] = toHaveStatusCode;

	toBe200= function( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 200 );
		return statusCodeTest( argumentCollection = arguments );
	};
	matchers[ "toBe200" ] = toBe200;

	toBe201= function( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 201 );
		return statusCodeTest( argumentCollection = arguments );
	};
	matchers[ "toBe201" ] = toBe201;

	toBe400= function( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 400 );
		return statusCodeTest( argumentCollection = arguments );
	};
	matchers[ "toBe400" ] = toBe400;

	tobe401= function( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 401 );
		return statusCodeTest( argumentCollection = arguments );
	};
	matchers[ "toBe401" ] = toBe401;

	tobe403= function( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 403 );
		return statusCodeTest( argumentCollection = arguments );
	};
	matchers[ "toBe403" ] = toBe403;

	toBe404= function( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 404 );
		return statusCodeTest( argumentCollection = arguments );
	};
	matchers[ "toBe404" ] = toBe404;

	tobe405= function( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 405 );
		return statusCodeTest( argumentCollection = arguments );
	};
	matchers[ "toBe405" ] = toBe405;

	tobe422= function( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 422 );
		return statusCodeTest( argumentCollection = arguments );
	};
	matchers[ "toBe422" ] = toBe422;

	tobe500= function( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 500 );
		return statusCodeTest( argumentCollection = arguments );
	};
	matchers[ "toBe500" ] = toBe500;

	// Private helper methods
	var statusCodeTest = function( expectation, args = {} ) {
        // handle both positional and named arguments
        param args.statusCode = "";
        if ( structKeyExists( args, 1 ) ) {
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