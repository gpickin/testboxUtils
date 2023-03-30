component singleton extends="testboxUtils.models.baseMatcher" {
	
    function lengthTest( expectation, args = {} ) {
		// handle both positional and named arguments
		param args.value = "";
		if ( structKeyExists( args, 1 ) ) {
			args.value = args[ 1 ];
		}

		param args.message = "";
		if ( structKeyExists( args, 2 ) ) {
			args.message = args[ 2 ];
		}

		param args.operator = "GT";
		if ( structKeyExists( args, 3 ) ) {
			args.value = args[ 3 ];
		}

		if ( !isNumeric( args.value )) {
			expectation.message = "The value you are testing must be a valid number";
			return false;
		}
		try{
			var length = expectation.actual.len();
		} catch ( any e ){
			expectation.message = "The length of the Item could not be found";
			return false;
		}

		expectation.original_message = expectation.message;
		expectation.message = "The length of the item was #length# which is not #args.operator# #args.value#";
		if( args.operator == "GT" && length <= args.value ){
			return false;
		}
		if( args.operator == "GTE" && length < args.value ){
			return false;
		}
		if( args.operator == "LT" && length >= args.value ){
			return false;
		}
		if( args.operator == "LTE" && length > args.value ){
			return false;
		}
		expectation.message = expectation.original_message;
		return true;
	};

    function toHaveLengthGT( expectation, args = {} ) {
		args[ "operator" ] = "GT";
		return lengthTest( expectation, args );
	}
	
	function toHaveLengthGTE( expectation, args = {} ) {
		args[ "operator" ] = "GTE";
		return lengthTest( expectation, args );
	}

	function toHaveLengthLT( expectation, args = {} ) {
		args[ "operator" ] = "LT";
		return lengthTest( expectation, args );
	}
	
	function toHaveLengthLTE( expectation, args = {} ) {
		args[ "operator" ] = "LTE";
		return lengthTest( expectation, args );
	}
    
}