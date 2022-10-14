component extends="coldbox.system.testing.BaseTestCase" {

    

    /**
     * @beforeAll
     */
    function setupTestBoxUtils() {
        variables.testboxUtils = getWireBox().getInstance( "api@testboxUtils" );
        variables.testHelpers = variables.testboxUtils.getHelpers();
        addMatchers( variables.testboxUtils.getMatchers() );
    }

    /**
     * @beforeEach
     */
    function setupIntegrationTest() {
        setup();
    }

}
