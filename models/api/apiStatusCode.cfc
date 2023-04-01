component extends="testboxUtils.models.baseModel" {

    filePrefix = "apiStatusCode";
    function getMatchers( includes = "", excludes = "" ) {
        return includeMatchersFromFilePath(
            path = "./",
            includes = arguments.includes,
            excludes = arguments.excludes,
            filePrefix = variables.filePrefix
        );
    }

    function getHelpers( includes = "", excludes = "" ) {
        return includeHelpersFromFilePath(
            path = "./",
            includes = arguments.includes,
            excludes = arguments.excludes,
            filePrefix = variables.filePrefix
        );
    }

}
