component singleton extends="testboxUtils.models.baseMatcher" {

    // TODO: Implement these
    // - .toHaveKeys( list ) //include all keys In list
    // - .toHaveExactKeys( list ) // toOnlyHaveKeys()
    // - .toHaveKeysWithCase( list )
    // - .tpHaveExactKeysWithCase( list )
    // - .toOnlyHaveKeysWithCase( list )
    // - .toMatchStructure( struct )
    // - .toMatchStructWithCase( struct )

    function toHaveKeyWithCase( expectation, args = {} ) {
        // handle both positional and named arguments
        param args.key = "";
        if ( structKeyExists( args, 1 ) ) {
            args.key = args[ 1 ];
        }
        param args.message = "";
        if ( structKeyExists( args, 2 ) ) {
            args.message = args[ 2 ];
        }

        if ( args.key == "" ) {
            expectation.message = "No Key Provided.";
            return false;
        }

        if ( expectation.isNot ) {
            if ( listFind( expectation.actual.keyList(), args.key ) ) {
                expectation.message = "The key(s) [#args.key#] does exist in the target object, with case sensitivity.";
                return false;
            }
            return true;
        } else {
            if ( !listFind( expectation.actual.keyList(), args.key ) ) {
                if ( listFindNoCase( expectation.actual.keyList(), args.key ) ) {
                    expectation.message = "The key(s) [#args.key#] does exist in the target object, but the Case is incorrect. Found keys are [#structKeyArray( expectation.actual ).toString()#]";
                } else {
                    expectation.message = "The key(s) [#args.key#] does not exist in the target object, with or without case sensitivity. Found keys are [#structKeyArray( expectation.actual ).toString()#]";
                }
                return false;
            }

            return true;
        }
    }

}
