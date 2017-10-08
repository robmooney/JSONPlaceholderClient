//
//  PostRequestTests.swift
//  JSONPlaceholderClientTests
//
//  Created by Robert Mooney on 08/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import XCTest
@testable import JSONPlaceholderClient

class PostRequestTests: XCTestCase {
    
    var postsRequest: PostsAPIRequest!
    
    override func setUp() {
        super.setUp()
        
        postsRequest = MockPostsAPIRequest()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPostsRequest_Completion() {
        postsRequest.completion = { posts, error in }
        XCTAssertNotNil(postsRequest.completion)
    }
    
    func testPostsRequest_Resume() {
        XCTAssertNotNil(postsRequest.resume)
    }
    
    func testPostsRequest_Cancel() {
        XCTAssertNotNil(postsRequest.cancel)
    }
    
    func testPostsRequest_Success() {
        let expectation = XCTestExpectation(description: "Users requested sucessfully")
        
        postsRequest.completion = { posts, error in
            XCTAssertNil(error)
            XCTAssertNotNil(posts)
            
            expectation.fulfill()
        }
        
        postsRequest.resume()
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testPostsRequest_Fail() {
        let expectation = XCTestExpectation(description: "Users request failed")
        
        postsRequest = MockPostsAPIRequest(shouldFail: true)
        
        postsRequest.completion = { posts, error in
            XCTAssertNotNil(error)
            XCTAssertNil(posts)
            
            expectation.fulfill()
        }
        
        postsRequest.resume()
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testPostsRequest_Cancelled() {
        let expectation = XCTestExpectation(description: "Users request cancelled")
        
        postsRequest.completion = { posts, error in
            XCTAssertNotNil(error)
            XCTAssertNil(posts)
            
            expectation.fulfill()
        }
        
        postsRequest.resume()
        postsRequest.cancel()
        
        wait(for: [expectation], timeout: 10.0)
    }
}
