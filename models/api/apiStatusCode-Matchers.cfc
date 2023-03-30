component singleton  extends="testboxUtils.models.baseMatcher" {

	// helpers = new "apiStatusCode-helpers"();
    // TODO: TO IMPLEMENT
	// - toSucceed() toBeASuccess() tobeASuccess() // isSuccessful() isSuccess()
	// - ToFail() ToBeAFailure() toHaveFailed() // isFailure() hasFailed()

	cfinclude( template="apiStatusCode-matcherHelpers.cfm" );

	function toHaveStatusCode( expectation, args = {} ) {
		// writeDump( "tohavestatuscode" );
		// writeDump( var=arguments, top=1 );
		return _statusCodeTest( arguments.expectation, arguments.args );
	};

	function toBe200( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 200 );
		return _statusCodeTest( argumentCollection = arguments );
	};

	function toBe201( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 201 );
		return _statusCodeTest( argumentCollection = arguments );
	};

	function toBe400( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 400 );
		return _statusCodeTest( argumentCollection = arguments );
	};

	function tobe401( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 401 );
		return _statusCodeTest( argumentCollection = arguments );
	};

	function tobe403( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 403 );
		return _statusCodeTest( argumentCollection = arguments );
	};

	function toBe404( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 404 );
		return _statusCodeTest( argumentCollection = arguments );
	};

	function tobe405( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 405 );
		return _statusCodeTest( argumentCollection = arguments );
	};

	function toBe412( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 412 );
		return _statusCodeTest( argumentCollection = arguments );
	};

	function tobe422( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 422 );
		return _statusCodeTest( argumentCollection = arguments );
	};

	/**
	 * Undocumented function
	 *
	 * @expectation 
	 * @args 
	 */
	function tobe500( expectation, args = {} ) {
		arguments.args = prependToArgs( args, 500 );
		return _statusCodeTest( argumentCollection = arguments );
	};

	

	// Private helper methods
	

}