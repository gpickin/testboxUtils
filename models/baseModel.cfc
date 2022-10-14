component {

    function prependToArgs( args, value ) {
        if ( arguments.args.keyExists( "1" ) ) {
            arguments.args[ "2" ] = arguments.args[ "1" ];
        }
        arguments.args[ "1" ] = arguments.value;
        return arguments.args;
    }

    function includeMatchersFromFilePath( path = "" ) {
        return includeItemsFromFilePath( path = arguments.path, filter = "*Matchers.cfm", varName = "matchers" );
    }

    function includeHelpersFromFilePath( path = "" ) {
        return includeItemsFromFilePath( path = arguments.path, filter = "*Helpers.cfm", varName = "helpers" );
    }

    function includeItemsFromFilePath( subfolder = "", filter = "*Matchers.cfm", varName = "matchers" ) {
        var items = {};

        for (
            var currentFile in directoryList(
                path = "/testboxUtils/#arguments.subfolder#",
                listInfo = "path",
                recurse = true,
                filter = arguments.filter
            )
        ) {
            var fixedPath = expandPath( "/testboxUtils" );
            var includePath = "/testboxUtils#replace( currentFile, fixedPath, "" )#";
            // includePath = replace( includePath, "\\", "/", "all" );
            include includePath;
            items.append( local[ arguments.varName ] );
        }
        return items;
    }

}
