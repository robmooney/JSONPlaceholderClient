//
//  PostCellTests.swift
//  JSONPlaceholderClientTests
//
//  Created by Robert Mooney on 08/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import XCTest
@testable import JSONPlaceholderClient

class PostCellTests: XCTestCase {
    
    var postsTableViewController: PostsTableViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        postsTableViewController = storyboard.instantiateViewController(withIdentifier: "postsTableViewController") as! PostsTableViewController
        postsTableViewController.api = MockAPI()
        let user = User(
            id: 1,
            name: "Leanne Graham",
            username: "Bret",
            email: "Sincere@april.biz",
            address: Address(
                street: "Kulas Light",
                suite: "Apt. 556",
                city: "Gwenborough",
                zipcode: "92998-3874"
            )
        )
        postsTableViewController.user = user
        _ = postsTableViewController.view
    }
    
    func firstCell() -> PostCell {
        return self.postsTableViewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! PostCell
    }
    
    func testPostCell_HasTitleLabel() {
        let expectation = XCTestExpectation(description: "Post cell has title label")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let cell = self.firstCell()
            XCTAssertNotNil(cell.titleLabel)
            XCTAssertEqual(cell.titleLabel.text, "sunt aut facere repellat provident occaecati excepturi optio reprehenderit")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testUserCell_HasBodyLabel() {
        let expectation = XCTestExpectation(description: "Post cell has body label")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let cell = self.firstCell()
            XCTAssertNotNil(cell.bodyLabel)
            XCTAssertEqual(cell.bodyLabel.text, "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
}
