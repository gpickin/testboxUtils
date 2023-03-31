<cfscript>
    var validRoute = "/";
    var statusCodes = [
        200,
        201,
        400,
        401,
        403,
        404,
        405,
        412,
        422,
        500
    ];
    // for ( var test in testsToRun ) {
    //     story( "#test.story.description# #test.story.functionName#()", function() {
    //         given( "we call the #test.story.functionName#() function", function() {
    //             for ( item in test.story.given.array ) {
    //                 when( when="the event is a #item.statuscode#", data=item, body=function( item ) {
    //                     then( then="the #test.story.functionName#() expectation will #item.result ? "succeed" : "fail"#", data=item, body=function( item) {
    //                         var event = this.get( "#validRoute#" );
    //                         event.setHTTPHeader( item.statuscode );
    //                         if ( item.result ) {
    //                             invoke( expect( event ), test.story.functionName );
    //                         } else {
    //                             
    //                         }
    //                     } );
    //                 });
    //             }
    //         } );
    //     } );
    // }

    // for ( var statusCode in statusCodes ) {
        story( "#test.description# #test.functionName#()", function() {
            given( "we call the #test.functionName#() function", function() {
                for ( responseStatusCode in statusCodes ) {
                    when( when="the event is a #responseStatusCode#", data={ "responseStatusCode": responseStatusCode }, body=function() {
                        then( then="the #test.functionName#() expectation will #test.successfulStatusCode == responseStatusCode ? "succeed" : "fail"#", data={ "responseStatusCode": responseStatusCode }, body=function() {
                            var event = this.get( "#validRoute#" );
                            event.setHTTPHeader( responseStatusCode );
                            if ( test.successfulStatusCode == responseStatusCode ) {
                                invoke( expect( event ), test.functionName );
                            } else {
                                invoke( expect( event ), "not#test.functionName#" );
                            }
                        } );
                    } );
                }
            } );
        } );
    // }
</cfscript>