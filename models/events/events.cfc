component extends="testboxUtils.models.baseModel" {

    function getMatchers( includes = "", excludes = "" ) {
        return includeMatchersFromFilePath(
            path = "events",
            includes = arguments.includes,
            excludes = arguments.excludes
        );
    }

    function getHelpers( includes = "", excludes = "" ) {
        return includeHelpersFromFilePath(
            path = "events",
            includes = arguments.includes,
            excludes = arguments.excludes
        );
    }

}
