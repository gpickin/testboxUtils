component {

    function includeMatchersFromFilePath(
        path = "",
        includes = "",
        excludes = "",
        filePrefix = ""
    ) {
        return includeItemsFromFilePath(
            subfolder = arguments.path,
            filter = "*-Matchers.cfc",
            varName = "matchers",
            includes = arguments.includes,
            excludes = arguments.excludes,
            filePrefix = arguments.filePrefix
        );
    }

    function includeHelpersFromFilePath(
        path = "",
        includes = "",
        excludes = "",
        filePrefix = ""
    ) {
        return includeItemsFromFilePath(
            subfolder = arguments.path,
            filter = "*-Helpers.cfc",
            varName = "helpers",
            includes = arguments.includes,
            excludes = arguments.excludes,
            filePrefix = arguments.filePrefix
        );
    }

    function includeItemsFromFilePath(
        subfolder = "",
        filter = "*-Matchers.cfc",
        varName = "matchers",
        includes = "",
        excludes = "",
        filePrefix = ""
    ) {
        var items = {};
        var directories = [];

        if ( arguments.includes.listLen() == 0 ) {
            directories = directoryList(
                path = "/testboxUtils/#arguments.subfolder#",
                listInfo = "path",
                recurse = true,
                filter = "#arguments.filePrefix##arguments.filter#"
            );
        } else {
            directories = directoryList(
                path = "/testboxUtils/#arguments.subfolder#",
                listInfo = "path",
                recurse = true,
                filter = "#arguments.filePrefix##arguments.filter#"
            )
        }
        // writeDump( directories );abort;
        for ( var currentFile in directories ) {
            var fixedPath = expandPath( "/testboxUtils" );
            var includePath = "/testboxUtils/#replace( listDeleteAt( currentFile, listLen( currentFile, "." ), "." ), fixedPath, "" )#";
            items.append( invoke( includePath, "get#arguments.varName#" ) );
        }
        return items;
    }

}
