//
//  Address.swift
//  JSONPlaceholderClient
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

struct Address: Decodable {
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
}

extension Address: CustomStringConvertible {
    var description: String {
        return [street, suite, city, zipcode].flatMap { $0 } .joined(separator: "\n")
    }
}
