component extends="testboxUtils.models.baseModel" {

    function getMatchers() {
        return includeMatchersFromFilePath( path = expandPath( "./" ) );
    }

    function getHelpers() {
        return includeHelpersFromFilePath( path = expandPath( "./" ) );
    }

}
