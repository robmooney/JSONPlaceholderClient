//
//  UsersRequest.swift
//  JSONPlaceholderClient
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import Foundation

class UsersRequest {
    
    let url: URL
    
    var completion: (([User]?, Error?) -> ())?
    
    init(url: URL) {
        self.url = url
    }
    
    func resume() { }
    
    func cancel() { }
}
