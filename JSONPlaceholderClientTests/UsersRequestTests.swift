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
        
        usersRequest = MockUsersRequest()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUsersRequest_Completion() {
        usersRequest.completion = { users, error in }
        XCTAssertNotNil(usersRequest.completion)
    }
    
    func testUsersRequest_Resume() {
        XCTAssertNotNil(usersRequest.resume)
    }
    
    func testUsersRequest_Cancel() {
        XCTAssertNotNil(usersRequest.cancel)
    }
    
    func testUsersRequest_Success() {
        let expectation = XCTestExpectation(description: "Users requested sucessfully")
        
        usersRequest.completion = { users, error in
            XCTAssertNil(error)
            XCTAssertNotNil(users)
            
            expectation.fulfill()
        }
        
        usersRequest.resume()
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testUsersRequest_Fail() {
        let expectation = XCTestExpectation(description: "Users request failed")
        
        usersRequest = MockUsersRequest(shouldFail: true)
        
        usersRequest.completion = { users, error in
            XCTAssertNotNil(error)
            XCTAssertNil(users)
            
            expectation.fulfill()
        }
        
        usersRequest.resume()
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testUsersRequest_Cancelled() {
        let expectation = XCTestExpectation(description: "Users request cancelled")
        
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
