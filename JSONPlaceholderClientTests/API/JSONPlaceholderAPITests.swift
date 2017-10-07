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
    
    var api: API!
    
    override func setUp() {
        super.setUp()
        
        api = MockJSONPlaceholderAPI()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testJSONPlaceholderAPI_UsersRequest() {
        let expectation = XCTestExpectation(description: "API users request succeeded")
        
        let usersRequest = api.makeUsersAPIRequest()
        
        usersRequest.completion = { users, error in
            XCTAssertNil(error)
            XCTAssertEqual(users?.count, 1)
            
            expectation.fulfill()
        }
        
        usersRequest.resume()
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testHTTPJSONPlaceholderAPI_UsersRequest() {
        let expectation = XCTestExpectation(description: "API users request succeeded")
        
        api = URLSessionAPI(endpoint: URL(string: "https://jsonplaceholder.typicode.com")!)
        
        let usersRequest = api.makeUsersAPIRequest()
        
        usersRequest.completion = { users, error in
            XCTAssertNil(error)
            XCTAssertGreaterThan(users?.count ?? 0, 0)
            
            expectation.fulfill()
        }
        
        usersRequest.resume()
        
        wait(for: [expectation], timeout: 10)
    }
    
}
