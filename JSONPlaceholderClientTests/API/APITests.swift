//
//  APITests.swift
//  JSONPlaceholderClientTests
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import XCTest
@testable import JSONPlaceholderClient

class APITests: XCTestCase {
    
    var api: API!
    
    override func setUp() {
        super.setUp()
        
        api = MockAPI()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAPI_UsersRequest() {
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
    
    func testURLSessionAPI_UsersRequest() {
        let expectation = XCTestExpectation(description: "URL session API users request succeeded")
        
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
    
    func testAPI_PostsRequest() {
        let expectation = XCTestExpectation(description: "API posts request succeeded")
        
        var user = User()
        user.name = "Leanne Graham"
        user.username = "Bret"
        user.email = "Sincere@april.biz"
        user.address = Address(street: "Kulas Light", suite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3874")
        
        let postsRequest = api.makePostsAPIRequest(forUser: user)
        
        postsRequest.completion = { posts, error in
            XCTAssertNil(error)
            XCTAssertEqual(posts?.count, 1)
            
            expectation.fulfill()
        }
        
        postsRequest.resume()
        
        wait(for: [expectation], timeout: 10)
    }
    
}
