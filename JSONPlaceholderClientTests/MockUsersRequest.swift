//
//  MockUsersRequest.swift
//  JSONPlaceholderClientTests
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import Foundation
@testable import JSONPlaceholderClient

class MockUsersRequest: UsersRequest {
    
    enum MockError: Error {
        case error
    }
    
    var shouldFail = false
    var isCancelled = false
    
    override func resume() {
        DispatchQueue.global().async {
            if self.shouldFail || self.isCancelled {
                self.completion?(nil, MockError.error)
            } else {
                self.completion?([], nil)
            }
        }
    }
    
    override func cancel() {
        isCancelled = true
    }
}
