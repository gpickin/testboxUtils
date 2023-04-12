component {

    property name="controller" inject="coldbox";
    /***
     * Helper method to simply a "clean" reload of a wirebox mapping from the file system
     **/
    function reloadModule( required string moduleName ) {
        variables.controller.getServices().moduleService.reload( moduleName );
    }

    /***
     * Accepts the name of a mapping and

    function reloadMapping( required string mapping, required string targetPath ) {
        variables.controller
            .getWireBox()
            .getBinder()
            .map( mapping )
            .to( targetPath );
    }**/

    /***
     * Accepts a mapping name and stores the mapping from WireBox in the variables scope in order to be restored later.
     *
     **/
    function storeOriginalMapping( mappingName ) {
        variables.originalMappings = variables.keyExists( "originalMappings" ) ? variables.originalMappings : {};
        var binder = variables.controller.getWireBox().getBinder();
        variables.controller.getWirebox().getInstance( mappingName );
        variables.originalMappings[ mappingName ] = variables.controller
            .getWireBox()
            .getBinder()
            .getMapping( mappingName );
    }

    /***
     * Loops through the stored mappings and restores them to WireBox
     *
     **/
    function restoreMappings() {
        variables.originalMappings.each( function( mapping, comp ) {
            variables.controller
                .getWireBox()
                .getBinder()
                .setMapping( mapping, comp );
        } );
    }

}
