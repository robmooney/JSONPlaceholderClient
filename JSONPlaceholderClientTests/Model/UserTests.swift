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
    
    func testUser_FromJSON() {
        let JSON = """
            {
                "address": {
                    "city": "Gwenborough",
                    "geo": {
                        "lat": "-37.3159",
                        "lng": "81.1496"
                    },
                    "street": "Kulas Light",
                    "suite": "Apt. 556",
                    "zipcode": "92998-3874"
                },
                "company": {
                    "bs": "harness real-time e-markets",
                    "catchPhrase": "Multi-layered client-server neural-net",
                    "name": "Romaguera-Crona"
                },
                "email": "Sincere@april.biz",
                "id": 1,
                "name": "Leanne Graham",
                "phone": "1-770-736-8031 x56442",
                "username": "Bret",
                "website": "hildegard.org"
            }
            """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        user = try! decoder.decode(User.self, from: JSON)
        
        XCTAssertEqual(user.name, "Leanne Graham")
        XCTAssertEqual(user.username, "Bret")
        XCTAssertEqual(user.email, "Sincere@april.biz")
        XCTAssertEqual(user.address?.city, "Gwenborough")
        XCTAssertEqual(user.address?.street, "Kulas Light")
        XCTAssertEqual(user.address?.suite, "Apt. 556")
        XCTAssertEqual(user.address?.zipcode, "92998-3874")
    }
    
}
