//
//  UserCellTests.swift
//  JSONPlaceholderClientTests
//
//  Created by Robert Mooney on 07/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import XCTest
@testable import JSONPlaceholderClient

class UserCellTests: XCTestCase {
    
    var usersTableViewController: UsersTableViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        usersTableViewController = storyboard.instantiateViewController(withIdentifier: "usersTableViewController") as! UsersTableViewController
        usersTableViewController.api = MockAPI()
        _ = usersTableViewController.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func firstCell() -> UserCell {
        return self.usersTableViewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! UserCell
    }
    
    func testUserCell_HasNameLabel() {
        let expectation = XCTestExpectation(description: "User cell has name label")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let cell = self.firstCell()
            XCTAssertNotNil(cell.nameLabel)
            XCTAssertEqual(cell.nameLabel.text, "Leanne Graham")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testUserCell_HasUsernameLabel() {
        let expectation = XCTestExpectation(description: "User cell has username label")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let cell = self.firstCell()
            XCTAssertNotNil(cell.usernameLabel)
            XCTAssertEqual(cell.usernameLabel.text, "@Bret")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testUserCell_HasEmailButton() {
        let expectation = XCTestExpectation(description: "User cell has email button")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let cell = self.firstCell()
            XCTAssertNotNil(cell.emailButton)
            XCTAssertEqual(cell.emailButton.titleLabel?.text, "Sincere@april.biz")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testUserCell_HasAddressLabel() {
        let expectation = XCTestExpectation(description: "User cell has address label")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let cell = self.firstCell()
            XCTAssertNotNil(cell.addressLabel)
            let address = """
                Kulas Light
                Apt. 556
                Gwenborough
                92998-3874
                """
            XCTAssertEqual(cell.addressLabel.text, address)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
}
