component singleton {

    function prependToArgs( args, value ) {
        if ( arguments.args.keyExists( "1" ) ) {
            arguments.args[ "2" ] = arguments.args[ "1" ];
        }
        arguments.args[ "1" ] = arguments.value;
        return arguments.args;
    }

    function getHelpers() {
        return variables.filter( function( key ) {
            return key != "THIS" && key != "getmatchers" & key != "gethelpers";
        } );
    }

}
