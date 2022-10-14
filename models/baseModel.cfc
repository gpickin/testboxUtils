component {

    property name="moduleConfig" inject="coldbox:moduleConfig:testboxUtils";

    function prependToArgs( args, value ) {
        if ( arguments.args.keyExists( "1" ) ) {
            arguments.args[ "2" ] = arguments.args[ "1" ];
        }
        arguments.args[ "1" ] = arguments.value;
        return arguments.args;
    }

    function includeMatchersFromFilePath( path = moduleConfig.PATH ) {
        return includeItemsFromFilePath( path = arguments.path, filter = "*Matchers.cfm", varName = "matchers" );
    }

    function includeHelpersFromFilePath( path = moduleConfig.PATH ) {
        return includeItemsFromFilePath( path = arguments.path, filter = "*Helpers.cfm", varName = "helpers" );
    }

    function includeItemsFromFilePath( subfolder = moduleConfig.PATH, filter = "*Matchers.cfm", varName = "matchers" ) {
        var items = {};
        
        for (
            var currentFile in directoryList(
                path = "#arguments.subfolder#",
                listInfo = "path",
                recurse = true,
                filter = arguments.filter
            )
        ) {
            var fixedPath = replace( moduleConfig.PATH, "\\", server.separator.file, "all" );
            fixedPath = replace( fixedPath, "/", server.separator.file, "all" );
            
            var includePath = "#moduleConfig.MAPPING##server.separator.file##replace( currentFile, fixedPath & server.separator.file, "" )#";
            includePath = replace( includePath, "\\", "/", "all" );
            include includePath;
            items.append( local[ arguments.varName ] );
        }
        return items;
    }

}
