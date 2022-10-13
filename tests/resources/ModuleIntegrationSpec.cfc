component extends="coldbox.system.testing.BaseTestCase" {

    

    /**
     * @beforeAll
     */
    function setupTestBoxUtils() {
        variables.testBoxUtils = getWireBox().getInstance( "api@testbox-utils" );
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
