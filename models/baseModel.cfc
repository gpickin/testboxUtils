component {

    function prependToArgs( args, value ) {
        if ( arguments.args.keyExists( "1" ) ) {
            arguments.args[ "2" ] = arguments.args[ "1" ];
        }
        arguments.args[ "1" ] = arguments.value;
        return arguments.args;
    }

    function includeMatchersFromFilePath( path = "./" ) {
        return includeItemsFromFilePath( path = arguments.path, filter = "*Matchers.cfm", varName = "matchers" );
    }

    function includeHelpersFromFilePath( path = "./" ) {
        return includeItemsFromFilePath( path = arguments.path, filter = "*Helpers.cfm", varName = "helpers" );
    }

    function includeItemsFromFilePath( subfolder = "./", filter = "*Matchers.cfm", varName = "matchers" ) {
        var items = {};
        var baseDirectory = expandPath( "/root" ); // getDirectoryFromPath( expandPath( "/testingModuleRoot" ) );
        // writeDump( baseDirectory );abort;
        for (
            var currentFile in directoryList(
                path = "#arguments.subfolder#",
                listInfo = "path",
                recurse = true,
                filter = arguments.filter
            )
        ) {
            // writeDump( currentFile );abort;

            include "#replaceNoCase( currentFile, baseDirectory, "" )#";
            items.append( local[ arguments.varName ] );
        }
        return items;
    }

    // getMatchers(){
    //     if( !variables.keyExists( "filePrefix" ) ){
    //         throw( type="testbox-utils-matcher-missing-file-prefix", message="You must set the filePrefix property on the matcher before calling getMatchers()" );
    //     }
    //     // try{
    //         include "#filePrefix#Matchers.cfm";
    //     // }
    //     // catch ( any e ){
    //     //     throw( type="testbox-utils-matcher-missing-file", message="You must create a #filePrefix#Matchers.cfm file in your test folder to use matchers" );
    //     // }
    //     return matchers
    //    }

    //    getHelpers(){
    //     if( !variables.keyExists( "filePrefix" ) ){
    //         throw( type="testbox-utils-helper-missing-file-prefix", message="You must set the filePrefix property on the matcher before calling getHelpers()" );
    //     }
    //     // try{
    //         include "#filePrefix#Helpers.cfm";
    //     // }
    //     // catch ( any e ){
    //     //     throw( type="testbox-utils-helper-missing-file", message="You must create a #filePrefix#Matchers.cfm file in your test folder to use helpers" );
    //     // }
    //     return helpers;
    //    }

}
