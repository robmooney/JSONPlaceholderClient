//
//  PostsAPIRequest.swift
//  JSONPlaceholderClient
//
//  Created by Robert Mooney on 08/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

class PostsAPIRequest: APIRequest {
    
    var posts: [Post]?
    
    var completion: (([Post]?, Error?) -> ())?
    
    override func complete() {
        completion?(posts, error)
    }
    
}
