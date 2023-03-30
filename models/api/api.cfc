component extends="testboxUtils.models.baseModel" {

    function getMatchers( includes = "", excludes = "" ) {
        return includeMatchersFromFilePath(
            path = "./api",
            includes = arguments.includes,
            excludes = arguments.excludes
        );
    }

    function getHelpers( includes = "", excludes = "" ) {
        return includeHelpersFromFilePath(
            path = "./api",
            includes = arguments.includes,
            excludes = arguments.excludes
        );
    }

}
