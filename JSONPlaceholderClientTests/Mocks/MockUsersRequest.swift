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
    
    private var shouldFail: Bool
    private var isCancelled = false
    
    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }
    
    override func resume() {
        DispatchQueue.global().async {
            if self.shouldFail || self.isCancelled {
                self.completion?(nil, MockError.error)
            } else {
                var user = User()
                user.name = "Leanne Graham"
                user.username = "Bret"
                user.email = "Sincere@april.biz"
                user.address = Address()
                self.completion?([user], nil)
            }
        }
    }
    
    override func cancel() {
        isCancelled = true
    }
}
