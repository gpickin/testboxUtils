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
        var test = { "story": { "description": "Using the Status Code Matcher", "function": "toHaveStatusCode" } };

        for ( var statusCode in statusCodes ) {
            story( "#test.story.description# #test.story.function#( #statusCode# )", function() {
                given( "we call the #test.story.function#() function", function() {
                    for ( testCode in statusCodes ) {
                        when( "the event is a #testCode#", function() {
                            then( "the #test.story.function#( #statusCode# ) expectation will #statusCode == testCode ? "succeed" : "fail"#", function() {
                                var event = this.get( "#validRoute#" );
                                event.setHTTPHeader( testCode );
                                if ( statusCode == testCode ) {
                                    expect( event )[ "#test.story.function#" ]( statusCode );
                                } else {
                                    expect( event )[ "not#test.story.function#" ]( statusCode );
                                }
                            } );
                        } );
                    }
                } );
            } );
        }
    }

}
