component extends="testboxUtils.models.baseModel" {

    function getMatchers() {
        return includeMatchersFromFilePath( path = "./" );
    }

    function getHelpers() {
        return includeHelpersFromFilePath( path = "./" );
    }

}
