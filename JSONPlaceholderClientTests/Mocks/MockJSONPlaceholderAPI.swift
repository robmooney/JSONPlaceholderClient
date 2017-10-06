//
//  MockJSONPlaceholderAPI.swift
//  JSONPlaceholderClientTests
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import Foundation
@testable import JSONPlaceholderClient

class MockJSONPlaceholderAPI: JSONPlaceholderAPI {
    
    override func makeUsersRequest() -> UsersRequest {
        return MockUsersRequest()
    }
}
