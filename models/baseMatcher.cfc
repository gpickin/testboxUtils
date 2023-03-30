component singleton {

    function prependToArgs( args, value ) {
        // writeDump( args );abort;
        if ( arguments.args.keyExists( "1" ) ) {
            arguments.args[ "2" ] = arguments.args[ "1" ];
        }
        arguments.args[ "1" ] = arguments.value;
        return arguments.args;
    }

    function getMatchers(){
		var matchers = {};
		for( var variable in variables ){
			if( exportFunction( variable ) ){
				matchers.append( { "#variable#": getFunction( variable ) } );
			}
		}
		return matchers;
	}

    function getFunction( variable ){
        var functionName = variable;
        return function( ){ 
            return variables[ variable ]( argumentCollection = arguments );
        };
    }

	private function exportFunction( variable ){
		var ignoreList = "THIS,helpers,getMatchers,getHelpers,exportFunction,prependToArgs";
		if( ignoreList.listContainsNoCase( variable ) ){
			return false;
		}  else if( left( variable, 1 ) == "_" ){
			return false;
		} else {
			return true;
		}
	}
    

}