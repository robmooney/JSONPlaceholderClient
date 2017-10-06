//
//  Address.swift
//  JSONPlaceholderClient
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

struct Address: Decodable {
    var city: String?
    var street: String?
    var suite: String?
    var zipcode: String?
}

extension Address: CustomStringConvertible {
    var description: String {
        return [city, street, suite, zipcode].flatMap { $0 } .joined(separator: "\n")
    }
}
