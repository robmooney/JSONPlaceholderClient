//
//  AddressTests.swift
//  JSONPlaceholderClientTests
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import XCTest
@testable import JSONPlaceholderClient

class AddressTests: XCTestCase {
    
    var address: Address!
    
    override func setUp() {
        super.setUp()
        
        address = Address()
    }
    
    func testAddress_City() {
        address.city = "Gwenborough"
        XCTAssertEqual(address?.city, "Gwenborough")
    }
    
    func testAddress_Street() {
        address.street = "Kulas Light"
        XCTAssertEqual(address?.street, "Kulas Light")
    }
    
    func testAddress_Suite() {
        address.suite = "Apt. 556"
        XCTAssertEqual(address?.suite, "Apt. 556")
    }
    
    func testAddress_Zipcode() {
        address.zipcode = "92998-3874"
        XCTAssertEqual(address?.zipcode, "92998-3874")
    }
    
    func testAddress_Description() {
        address.city = "Gwenborough"
        address.street = "Kulas Light"
        address.suite = "Apt. 556"
        address.zipcode = "92998-3874"
        
        let description = """
            Kulas Light
            Apt. 556
            Gwenborough
            92998-3874
            """

        XCTAssertEqual("\(address!)", description)
    }
    
    func testAddress_FromJSON() {
        let JSON = """
            {
                "city": "Gwenborough",
                "geo": {
                    "lat": "-37.3159",
                    "lng": "81.1496"
                },
                "street": "Kulas Light",
                "suite": "Apt. 556",
                "zipcode": "92998-3874"
            }
            """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        address = try! decoder.decode(Address.self, from: JSON)

        XCTAssertEqual(address.city, "Gwenborough")
        XCTAssertEqual(address.street, "Kulas Light")
        XCTAssertEqual(address.suite, "Apt. 556")
        XCTAssertEqual(address.zipcode, "92998-3874")
    }
    
}
