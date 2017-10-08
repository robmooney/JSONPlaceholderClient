//
//  PostsTableViewControllerTests.swift
//  JSONPlaceholderClientTests
//
//  Created by Robert Mooney on 08/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import XCTest
@testable import JSONPlaceholderClient

class PostsTableViewControllerTests: XCTestCase {
    
    var postsTableViewController: PostsTableViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        postsTableViewController = storyboard.instantiateViewController(withIdentifier: "postsTableViewController") as! PostsTableViewController
        postsTableViewController.api = MockAPI()
        _ = postsTableViewController.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPostsTableViewController_NumberOfRows() {
        let expectation = XCTestExpectation(description: "Number of rows is 1")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.postsTableViewController.tableView.numberOfRows(inSection: 0), 1)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testPostsTableViewController_CellForRow() {
        let expectation = XCTestExpectation(description: "Cell for row 0 not nil")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertNotNil(self.postsTableViewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0)))
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testPostsTableViewController_CellForRowIsPostCell() {
        let expectation = XCTestExpectation(description: "Cell for row 0 is post cell")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let cell = self.postsTableViewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0))!
            XCTAssert(cell is PostCell)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
}
