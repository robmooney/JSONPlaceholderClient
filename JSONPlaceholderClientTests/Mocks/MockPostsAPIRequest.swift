//
//  MockPostsAPIRequest.swift
//  JSONPlaceholderClientTests
//
//  Created by Robert Mooney on 08/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import Foundation
@testable import JSONPlaceholderClient

class MockPostsAPIRequest: PostsAPIRequest {
    
    enum MockError: Error {
        case error
    }
    
    private var shouldFail: Bool
    private var isCancelled = false
    
    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }
    
    override func resume() {
        DispatchQueue.global().async {
            if self.shouldFail || self.isCancelled {
                self.error =  MockError.error
            } else {
                self.posts = [Post()]
            }
            self.complete()
        }
    }
    
    override func cancel() {
        isCancelled = true
    }
    
}
