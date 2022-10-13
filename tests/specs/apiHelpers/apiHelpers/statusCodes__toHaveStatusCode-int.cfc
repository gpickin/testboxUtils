component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    function beforeAll() {
        super.beforeAll();
    }

    function run() {
        describe( "Status Codes", function() {
            beforeEach( function( currentSpec ) {
            } );

            var validRoute = "/";
            story( "When we use the BaseWebhook Rest Handler", function() {
                given( "we can call the onError method", function() {
                    when( "an error is thrown", function() {
                        then( "the json will reflect an error value of true", function() {
                            var event = this.get( "#validRoute#" );
                            var response = event.getPrivateValue( "response" );
                            expect( response.getError() ).toBeTrue();
                        } );
                        then( "a error status code will not be returned - as the Webhook Handler must always return 200s", function() {
                            var event = this.get( "#validRoute#" );
                            expect( event ).toBe200();
                            expect( event ).toBe200( "I should be a 200" );
                            expect( event ).toBe200();
                        } );
                    } );
                } );
            } );
        } );
    }

}
