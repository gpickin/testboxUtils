component extends="testboxUtils.models.baseModel" {

    function getMatchers( includes = "" ) {
        if ( arguments.includes.listLen() == 0 ) {
            return includeMatchersFromFilePath( path = "./" );
        }
        // If we have a list of includes, we will only return the matchers for those includes
        var allMatchers = {}
        for ( var subfolder in listToArray( arguments.includes ) ) {
            allMatchers.append( includeMatchersFromFilePath( path = "./#subfolder#/" ) );
        }
        return allMatchers;
    }

    function getHelpers( includes = "" ) {
        if ( arguments.includes.listLen() == 0 ) {
            return includeHelpersFromFilePath( path = "./" );
        }
        // If we have a list of includes, we will only return the helpers for those includes
        var allMatchers = {}
        for ( var subfolder in listToArray( arguments.includes ) ) {
            allMatchers.append( includeHelpersFromFilePath( path = "./#subfolder#/" ) );
        }
        return allMatchers;
    }

}
