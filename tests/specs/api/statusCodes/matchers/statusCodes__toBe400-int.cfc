component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    function beforeAll() {
        super.beforeAll();
    }

    function run() {
        var test = {
            "description": "Using the Status Code Matcher",
            "functionName": "toBe400",
            "successfulStatusCode": 400
        };
        cfinclude( template = "inc_testLoop.cfm" );
    }

}
