component extends="coldbox.system.testing.BaseTestCase" {

    

    /**
     * @beforeAll
     */
    function setupTestBoxUtils() {
        variables.testboxUtils = getWireBox().getInstance( "all@testboxUtils" );
        structAppend( variables, variables.testboxUtils.getHelpers() );
        addMatchers( variables.testboxUtils.getMatchers() );
    }

    /**
     * @beforeEach
     */
    function setupIntegrationTest() {
        setup();
    }

}
