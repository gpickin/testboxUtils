component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    function beforeAll() {
        super.beforeAll();
    }

    function run() {
        cfinclude( template = "_ApiResponses.cfm" );
        var matchers = invoke( "/testboxUtils/models/api/apiResponse-Matchers", "getMatchers" );

        story( "Testing a Validity of an API Response", function() {
            given( "we call the toHaveAPIResponse() matcher", function() {
                for ( var key in responsesArray ) {
                    when( when="we test a #key#", body=function() {
                        if ( len( responsesArray[ key ].expectedError ) ) {
                            then(
                                then = "we expect the match to fail with the following message: '#responsesArray[ key ].expectedError#'",
                                data = { "key": key },
                                body = function( data ) {
                                    // writeDump( data );
                                    var internalKey = data.key;
                                    var expectation = { "actual": responsesArray[ internalKey ].data };
                                    matchers[ "toHaveAPIResponse" ]( expectation );
                                    expect( expectation.message ).toMatch( responsesArray[ internalKey ].expectedError );
                                }
                            );
                        } else {
                            then(
                                then = "we expect the match to pass",
                                data = { "key": key },
                                body = function( data ) {
                                    var internalKey = data.key;
                                    var expectation = { "actual": responsesArray[ internalKey ].data };
                                    matchers[ "toHaveAPIResponse" ]( expectation );
                                    expect( structKeyExists( expectation, "message" ) ).toBeFalse();
                                }
                            );
                        }
                    });
                }
            } );
        } );
    }

}
