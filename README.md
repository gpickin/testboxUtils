# testboxUtils

A group of TestBox utils to help you write more tests, efficiently. Including helpers, matchers and more

## Setup in your Tests

### Add the Application Mapping

This allows testboxUtils to do some very cool inclusions, without this mapping, the module won't work.

```
this.mappings["/testboxUtils"]   = rootPath & "/modules/testboxUtils";
```

### Add the Matchers to your Base Test

In the beforeAll() function of your Integration or Unit Base Test case, add the following lines to add matchers and helpers. This configuration uses all of the matchers / helpers, see below for customization options.

```
function beforeAll(){
	super.beforeAll();
    testboxUtils = new testboxUtils.models.all();
    addMatchers( variables.testboxUtils.getMatchers() );
    variables.append( variables.testboxUtils.getHelpers() );
}
```

With Integration tests, with Wirebox you could do this

```
function beforeAll(){
	super.beforeAll();
    testboxUtils = getWireBox().getInstance( "all@testboxUtils" );
    addMatchers( variables.testboxUtils.getMatchers() );
    variables.append( variables.testboxUtils.getHelpers() );
}
```

### Use the new matchers

There are lots of new matchers, here are a few samples

```
expect( event ).toBe200();
expect( event ).notToBe401();
expect( event ).toHaveStatusCode( 403 );
expect( event.getRenderedContent() ).toHaveStatusCode( 403 );
```

## How to only import the matchers you want?

This module is build with the following options, all, category, or specific utility itself.

You can use the syntax to get a specific set of matchers and helpers, matching your needs.

### Access all helpers and matchers

Module path instantion ( required for Unit tests )

- `new testboxUtils.models.all()` - All Matchers from all Categories

Optional Injection Syntax - Only available in Integration tests with Wirebox

- `inject="all@testboxUtils"` - Matchers and Helpers from all Categories

### Access helpers and matchers from a Category

Module path instantion ( required for Unit tests )

- `new testboxUtils.models.folderName.folderName()`
- `new testboxUtils.models.api.api()`
- Optional Injection Syntax - Only available in Integration tests with Wirebox

- `inject="foldername@testboxUtils"` - Matchers and Helpers from the folder subcategory
- `inject="api@testboxUtils"` - Matchers and Helpers from the subcategory called api

### Access helpers and matchers from a specific utility file

Module path instantion ( required for Unit tests )

- `new testboxUtils.models.folderName.utilityFileName()`
- `new testboxUtils.models.api.apiStatusCodes()`

Optional Injection Syntax - Only available in Integration tests with Wirebox

- `inject="utilityFileName@testboxUtils"` - Matchers and Helpers from the utility itself
- `inject="apiStatusCodes@testboxUtils"` - Matchers and Helpers from the apiStatusCodes utility itself

## Current Categories

### API

- apiStatusCodes
  - `expect( event|response ).toHaveStatusCode( numeric )`
  - `expect( event|response ).toBe200()`
  - `expect( event|response ).toBe201()`
  - `expect( event|response ).toBe400()`
  - `expect( event|response ).toBe401()`
  - `expect( event|response ).toBe403()`
  - `expect( event|response ).toBe404()`
  - `expect( event|response ).tobe500()`

### Events

- headers

### Utils

- CollectionLength
  - `expect( struct|array|list ).toHaveLengthGT( numeric )`
  - `expect( struct|array|list ).toHaveLengthGTE( numeric )`
  - `expect( struct|array|list ).toHaveLengthLT( numeric )`
  - `expect( struct|array|list ).toHaveLengthLTE( numeric )`
- StructKeys
  - `expect( struct ).toHaveKeyWithCase( "MyCasedKey" )`
