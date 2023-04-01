component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    function beforeAll() {
        super.beforeAll();
    }

    function run() {
        var validRoute = "/";
        var statusCodes = [
            200,
            201,
            400,
            401,
            403,
            404,
            405,
            412,
            422,
            500
        ];
        var test = { "story": { "description": "Using the Status Code Matcher", "functionName": "toHaveStatusCode" } };

        for ( var statusCode in statusCodes ) {
            story( "#test.story.description# #test.story.functionName#( #statusCode# )", function() {
                given( "we call the #test.story.functionName#() function", function() {
                    for ( testCode in statusCodes ) {
                        when(
                            when = "the event is a #testCode#",
                            data = { "testCode": testCode },
                            body = function() {
                                then(
                                    then = "the #test.story.functionName#( #statusCode# ) expectation will #statusCode == testCode ? "succeed" : "fail"#",
                                    data = { "testCode": testCode },
                                    body = function() {
                                        var event = this.get( "#validRoute#" );
                                        event.setHTTPHeader( testCode );
                                        if ( statusCode == testCode ) {
                                            expect( event )[ "#test.story.functionName#" ]( statusCode );
                                        } else {
                                            expect( event )[ "not#test.story.functionName#" ]( statusCode );
                                        }
                                    }
                                );
                            }
                        );
                    }
                } );
            } );
        }
    }

}
