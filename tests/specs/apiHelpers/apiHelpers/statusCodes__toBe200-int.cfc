component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    function beforeAll() {
        super.beforeAll();
    }

    function run() {
        describe( "Status Codes", function() {
            beforeEach( function( currentSpec ) {
            } );

            var validRoute = "/";
            story( "When we use the Status Code Matcher toBe200()", function() {
                given( "we expect to have a status code of 200", function() {
                    when( "the event is a 200", function() {
                        then( "the tobe200() expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            event.setHTTPHeader( 200 );
                            expect( event ).toBe200();
                        } );
                    } );
                    when( "the event is a 201", function() {
                        then( "the notToBe200() expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            event.setHTTPHeader( 201, "Created success" );
                            expect( event ).notToBe200();
                        } );
                    } );
                    when( "the event is a 400", function() {
                        then( "the notToBe200() expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            event.setHTTPHeader( 400, "Bad Request" );
                            expect( event ).notToBe200();
                        } );
                    } );
                    when( "the event is a 401", function() {
                        then( "the notToBe200() expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            event.setHTTPHeader( 401, "Unauthorized" );
                            expect( event ).notToBe200();
                        } );
                    } );
                    when( "the event is a 403", function() {
                        then( "the notToBe200() expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            event.setHTTPHeader( 403, "Forbidden" );
                            expect( event ).notToBe200()
                        } );
                    } );
                    when( "the event is a 422", function() {
                        then( "the notToBe200() expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            event.setHTTPHeader( 422, "Unprocessable Entity" );
                            expect( event ).notToBe200();
                        } );
                    } );
                    when( "the event is a 500", function() {
                        then( "the notToBe200() expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            event.setHTTPHeader( 500, "Internal Server Error" );
                            expect( event ).notToBe200();
                        } );
                    } );
                } );
            } );
        } );
    }

}
