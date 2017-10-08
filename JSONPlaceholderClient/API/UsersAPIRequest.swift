//
//  UsersAPIRequest.swift
//  JSONPlaceholderClient
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import Foundation

class UsersAPIRequest {
    
    var users: [User]?
    var error: Error?
    
    var completion: (([User]?, Error?) -> ())?
    
    func resume() { }
    
    func cancel() { }
    
    func complete() {
        completion?(users, error)
    }
    
}
