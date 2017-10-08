//
//  MockAPI.swift
//  JSONPlaceholderClientTests
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import Foundation
@testable import JSONPlaceholderClient

class MockAPI: API {
    
    override func makeUsersAPIRequest() -> UsersAPIRequest {
        return MockUsersAPIRequest()
    }
    
    override func makePostsAPIRequest(forUser user: User) -> PostsAPIRequest {
        return MockPostsAPIRequest()
    }
    
}
