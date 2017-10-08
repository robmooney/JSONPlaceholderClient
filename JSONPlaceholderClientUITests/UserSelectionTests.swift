//
//  UserSelectionTests.swift
//  JSONPlaceholderClientUITests
//
//  Created by Robert Mooney on 08/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import XCTest

class UserSelectionTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testUser_Selection() {
        XCUIApplication().tables.children(matching: .cell).firstMatch.tap()        
        XCTAssert(XCUIApplication().staticTexts["sunt aut facere repellat provident occaecati excepturi optio reprehenderit"].exists)
    }
    
}
