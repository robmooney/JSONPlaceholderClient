//
//  JSONPlaceholderAPI.swift
//  JSONPlaceholderClient
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import Foundation

class JSONPlaceholderAPI {
    
    func makeUsersRequest() -> UsersRequest {
        return UsersRequest(url: URL(string: "https://example.com")!)
    }
}
