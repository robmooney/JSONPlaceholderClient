//
//  HTTPUsersRequest.swift
//  JSONPlaceholderClient
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import Foundation

class HTTPUsersRequest: UsersRequest {
    
    var task: URLSessionDataTask?
    
    override func resume() {       
        task?.resume()
    }
    
    override func cancel() {
        task?.cancel()
    }
    
}
