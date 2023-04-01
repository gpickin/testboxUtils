/**
 * Unit tests for Model X
 */
component extends="tests.resources.BaseUnitTest" {

	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll() {
		// load ColdBox
		this.loadColdbox = false;

		// setup the model
		// super.setup();

		// init the model object
		// model.init();

        super.beforeAll();
	}

	function afterAll() {
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/

	function run() {
		var sut = {
			"description": "Fetch Ships Model",
			"model": "api-fetch.models.Ships",
			"functionsToCheck": [
				"getCruiseShips"
			]
		}
		var model = createMock( sut.model );
		describe( "#sut.description#", function() {
			it( "can be created", function() {
				expect( model ).toBeComponent();
			} );

			for( var functionName in sut.functionsToCheck ){
				it( title="has the #functionName# function", body=function(data) {
					debug( data.functionName );
					expect( structKeyExists( model,  data.functionName ) ).toBeTrue( "The Model does not have a variable called #data.functionName# - it has the following variables: #structKeyList( model, ', ' )#");
					expect( isCustomFunction( model[ data.functionName ] ) ).toBeTrue( "The Model variable #data.functionName# is not a function" );
				}, data={ "functionName": functionName } );
			}
		} );
	}

}

