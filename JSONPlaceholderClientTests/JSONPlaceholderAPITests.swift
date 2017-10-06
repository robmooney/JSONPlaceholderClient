//
//  JSONPlaceholderAPITests.swift
//  JSONPlaceholderClientTests
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import XCTest
@testable import JSONPlaceholderClient

class JSONPlaceholderAPITests: XCTestCase {
    
    var api: JSONPlaceholderAPI!
    
    override func setUp() {
        super.setUp()
        
        api = JSONPlaceholderAPI()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testJSONPlaceholderAPI_UsersRequest() {
        
        let usersRequest = api.makeUsersRequest()
        
        XCTAssertNotNil(usersRequest)
    }
    
}
