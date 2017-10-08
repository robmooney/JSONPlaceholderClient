//
//  Post.swift
//  JSONPlaceholderClient
//
//  Created by Robert Mooney on 08/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

struct Post: Decodable {
    var id: Int = 0
    var title: String?
    var body: String?
    var userId: Int = 0
}
