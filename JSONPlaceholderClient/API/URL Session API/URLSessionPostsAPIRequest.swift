//
//  URLSessionPostsAPIRequest.swift
//  JSONPlaceholderClient
//
//  Created by Robert Mooney on 08/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import Foundation

class URLSessionPostsAPIRequest: PostsAPIRequest {
    
    var task: URLSessionDataTask?
    
    override func resume() {
        task?.resume()
    }
    
    override func cancel() {
        task?.cancel()
    }
    
}
