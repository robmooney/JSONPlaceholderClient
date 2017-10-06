//
//  UsersRequestTests.swift
//  JSONPlaceholderClientTests
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import XCTest
@testable import JSONPlaceholderClient

class UsersRequestTests: XCTestCase {
    
    var usersRequest: UsersRequest!
    
    override func setUp() {
        super.setUp()
        
        usersRequest = MockUsersRequest(url: URL(string: "https://example.com")!)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUserRequest_URL() {
        XCTAssertEqual(usersRequest.url, URL(string: "https://example.com"))
    }
    
    func testUserRequest_Completion() {
        usersRequest.completion = { users, error in }
        XCTAssertNotNil(usersRequest.completion)
    }
    
    func testUserRequest_Resume() {
        XCTAssertNotNil(usersRequest.resume)
    }
    
    func testUserRequest_Cancel() {
        XCTAssertNotNil(usersRequest.cancel)
    }
    
    func testUserRequest_Success() {
        let expectation = XCTestExpectation(description: "Users requested sucessfully")
        
        usersRequest.completion = { users, error in
            XCTAssertNil(error)
            XCTAssertNotNil(users)
            
            expectation.fulfill()
        }
        
        usersRequest.resume()
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testUserRequest_Fail() {
        let expectation = XCTestExpectation(description: "Users requested failed")
        
        (usersRequest as? MockUsersRequest)?.shouldFail = true
        
        usersRequest.completion = { users, error in
            XCTAssertNotNil(error)
            XCTAssertNil(users)
            
            expectation.fulfill()
        }
        
        usersRequest.resume()
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testUserRequest_Cancelled() {
        let expectation = XCTestExpectation(description: "Users requested failed")
        
        usersRequest.completion = { users, error in
            XCTAssertNotNil(error)
            XCTAssertNil(users)
            
            expectation.fulfill()
        }
        
        usersRequest.resume()
        usersRequest.cancel()
        
        wait(for: [expectation], timeout: 10.0)
    }
    
}
