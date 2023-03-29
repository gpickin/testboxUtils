component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    function beforeAll() {
        super.beforeAll();
    }

    function run() {
        cfinclude( template = "_ApiResponses.cfm" );
        cfinclude( template = "/testboxUtils/models/api/apiResponseMatchers.cfm" );

        story( "Testing a Validity of an API Response", function() {
            given( "we call the toHaveAPIResponse() matcher", function() {
                for ( var key in responsesArray ) {
                    when( "we test a #key#", function() {
                        if ( len( responsesArray[ key ].expectedError ) ) {
                            then(
                                then = "we expect the match to fail with the following message: '#responsesArray[ key ].expectedError#'",
                                body = function( data ) {
                                    // writeDump( data );
                                    var internalKey = data.key;
                                    var expectation = { "actual": responsesArray[ internalKey ].data };
                                    matchers[ "toHaveAPIResponse" ]( expectation );
                                    expect( expectation.message ).toMatch( responsesArray[ internalKey ].expectedError );
                                },
                                data = { "key": key }
                            );
                        } else {
                            then(
                                then = "we expect the match to pass",
                                body = function( data ) {
                                    var internalKey = data.key;
                                    var expectation = { "actual": responsesArray[ internalKey ].data };
                                    matchers[ "toHaveAPIResponse" ]( expectation );
                                    expect( structKeyExists( expectation, "message" ) ).toBeFalse();
                                },
                                data = { "key": key }
                            );
                        }
                    } );
                }
            } );
        } );
    }

}
