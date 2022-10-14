component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    function beforeAll() {
        super.beforeAll();
    }

    function run() {
        describe( "Status Codes", function() {
            beforeEach( function( currentSpec ) {
            } );

            var validRoute = "/";
            story( "When we use the Status Code Matcher toHaveStatusCode()", function() {
                given( "the event is a 200", function() {
                    when( "we expect to have a status code of 200", function() {
                        then( "the expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            expect( event ).toHaveStatusCode( 200 );
                        } );
                    } );
                    when( "we expect to not have a status code of 201", function() {
                        then( "the expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            expect( event ).notToHaveStatusCode( 201 );
                        } );
                    } );
                    when( "we expect to not have a status code of 400", function() {
                        then( "the expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            expect( event ).notToHaveStatusCode( 400 );
                        } );
                    } );
                    when( "we expect to not have a status code of 401", function() {
                        then( "the expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            expect( event ).notToHaveStatusCode( 401 );
                        } );
                    } );
                    when( "we expect to not have a status code of 403", function() {
                        then( "the expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            expect( event ).notToHaveStatusCode( 403 );
                        } );
                    } );
                    when( "we expect to not have a status code of 500", function() {
                        then( "the expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            expect( event ).notToHaveStatusCode( 500 );
                        } );
                    } );
                } );
                given( "the event is a 201", function() {
                    when( "we expect to have a status code of 201", function() {
                        then( "the expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            event.setHTTPHeader( 201, "Created success" );
                            expect( event ).toHaveStatusCode( 201 );
                        } );
                    } );
                    when( "we expect to not have a status code of 200", function() {
                        then( "the expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            event.setHTTPHeader( 201, "Created success" );
                            expect( event ).notToHaveStatusCode( 200 );
                        } );
                    } );
                    when( "we expect to not have a status code of 400", function() {
                        then( "the expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            event.setHTTPHeader( 201, "Created success" );
                            expect( event ).notToHaveStatusCode( 400 );
                        } );
                    } );
                    when( "we expect to not have a status code of 401", function() {
                        then( "the expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            event.setHTTPHeader( 201, "Created success" );
                            expect( event ).notToHaveStatusCode( 401 );
                        } );
                    } );
                    when( "we expect to not have a status code of 403", function() {
                        then( "the expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            event.setHTTPHeader( 201, "Created success" );
                            expect( event ).notToHaveStatusCode( 403 );
                        } );
                    } );
                    when( "we expect to not have a status code of 422", function() {
                        then( "the expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            event.setHTTPHeader( 201, "Created success" );
                            expect( event ).notToHaveStatusCode( 422 );
                        } );
                    } );
                    when( "we expect to not have a status code of 500", function() {
                        then( "the expectation will succeed", function() {
                            var event = this.get( "#validRoute#" );
                            event.setHTTPHeader( 201, "Created success" );
                            expect( event ).notToHaveStatusCode( 500 );
                        } );
                    } );
                } );
            } );
        } );
    }

}
