//
//  PostsAPIRequest.swift
//  JSONPlaceholderClient
//
//  Created by Robert Mooney on 08/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

class PostsAPIRequest {
    
    var posts: [Post]?
    var error: Error?
    
    var completion: (([Post]?, Error?) -> ())?
    
    func resume() { }
    
    func cancel() { }
    
    func complete() {
        completion?(posts, error)
    }
    
}
