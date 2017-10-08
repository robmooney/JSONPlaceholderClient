//
//  UsersAPIRequest.swift
//  JSONPlaceholderClient
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import Foundation

class UsersAPIRequest: APIRequest {
    
    var users: [User]?
    
    var completion: (([User]?, Error?) -> ())?
    
    override func complete() {
        completion?(users, error)
    }
    
}
