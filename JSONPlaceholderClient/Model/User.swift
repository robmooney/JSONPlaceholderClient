//
//  User.swift
//  JSONPlaceholderClient
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

struct User: Decodable {
    var name: String?
    var username: String?
    var email: String?
    var address: Address?
}
