//
//  MockUsersAPIRequest.swift
//  JSONPlaceholderClientTests
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import Foundation
@testable import JSONPlaceholderClient

class MockUsersAPIRequest: UsersAPIRequest {
    
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
                let user = User(
                    id: 1,
                    name: "Leanne Graham",
                    username: "Bret",
                    email: "Sincere@april.biz",
                    address: Address(
                        street: "Kulas Light",
                        suite: "Apt. 556",
                        city: "Gwenborough",
                        zipcode: "92998-3874"
                    )
                )
                self.users = [user]
            }
            self.complete()
        }
    }
    
    override func cancel() {
        isCancelled = true
    }
    
}
