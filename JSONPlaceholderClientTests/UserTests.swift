//
//  UserTests.swift
//  JSONPlaceholderClientTests
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import XCTest
@testable import JSONPlaceholderClient

class UserTests: XCTestCase {
    
    var user: User!
    
    override func setUp() {
        super.setUp()
        
        user = User()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUser_Name() {
        user.name = "Leanne Graham"
        XCTAssertEqual(user.name, "Leanne Graham")
    }
    
    func testUser_Username() {
        user.username = "Bret"
        XCTAssertEqual(user.username, "Bret")
    }
    
    func testUser_Email() {
        user.email = "Sincere@april.biz"
        XCTAssertEqual(user.email, "Sincere@april.biz")
    }
    
    func testUser_Address() {
        var address = Address()
        address.city = "Gwenborough"
        user.address = address
        XCTAssertEqual(user.address?.city, "Gwenborough")
    }
    
}
