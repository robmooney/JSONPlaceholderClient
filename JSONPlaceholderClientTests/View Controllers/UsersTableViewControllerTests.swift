//
//  UsersTableViewControllerTests.swift
//  JSONPlaceholderClientTests
//
//  Created by Robert Mooney on 07/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import XCTest
@testable import JSONPlaceholderClient

class UsersTableViewControllerTests: XCTestCase {
    
    var usersTableViewController: UsersTableViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        usersTableViewController = storyboard.instantiateViewController(withIdentifier: "usersTableViewController") as! UsersTableViewController
        usersTableViewController.api = MockAPI()
        _ = usersTableViewController.view
    }
    
    func testUsersTableViewController_NumberOfRows() {
        let expectation = XCTestExpectation(description: "Number of rows is 1")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.usersTableViewController.tableView.numberOfRows(inSection: 0), 1)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testUsersTableViewController_CellForRow() {
        let expectation = XCTestExpectation(description: "Cell for row 0 not nil")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertNotNil(self.usersTableViewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0)))
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testUsersTableViewController_CellForRowIsUserCell() {
        let expectation = XCTestExpectation(description: "Cell for row 0 is user cell")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let cell = self.usersTableViewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0))!
            XCTAssert(cell is UserCell)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
}
