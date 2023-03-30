component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    function beforeAll() {
        super.beforeAll();
    }

    function run() {
        var validRoute = "/";
        var testsToRun = [
            {
                "story": {
                    "description": "Using the Status Code Matcher",
                    "function": "toBe400",
                    "given": {
                        "description": "",
                        "array": [
                            { "statusCode": 200, "result": false },
                            { "statusCode": 201, "result": false },
                            { "statusCode": 400, "result": true },
                            { "statusCode": 401, "result": false },
                            { "statusCode": 403, "result": false },
                            { "statusCode": 404, "result": false },
                            { "statusCode": 405, "result": false },
                            { "statusCode": 412, "result": false },
                            { "statusCode": 422, "result": false },
                            { "statusCode": 500, "result": false }
                        ]
                    }
                }
            }
        ];

        for ( var test in testsToRun ) {
            story( "#test.story.description# #test.story.function#()", function() {
                given( "we call the #test.story.function#() function", function() {
                    for ( item in test.story.given.array ) {
                        when( "the event is a #item.statuscode#", function() {
                            then( "the #test.story.function#() expectation will #item.result ? "succeed" : "fail"#", function() {
                                var event = this.get( "#validRoute#" );
                                event.setHTTPHeader( item.statuscode );
                                if ( item.result ) {
                                    expect( event )[ test.story.function ]( );
                                } else {
                                    expect( event )[ "not#test.story.function#" ]( );
                                }
                            } );
                        } );
                    }
                } );
            } );
        }
    }

}
