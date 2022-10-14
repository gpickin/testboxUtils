component extends="coldbox.system.testing.BaseTestCase" {

    

    /**
     * @beforeAll
     */
    function setupTestBoxUtils() {
        variables.testBoxUtils = getWireBox().getInstance( "api@testboxUtils" );
        variables.testHelpers = variables.testBoxUtils.getHelpers();
        addMatchers( variables.testBoxUtils.getMatchers() );
    }

    /**
     * @beforeEach
     */
    function setupIntegrationTest() {
        setup();
    }

}
