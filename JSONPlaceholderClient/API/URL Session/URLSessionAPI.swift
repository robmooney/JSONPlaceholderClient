//
//  URLSessionAPI.swift
//  JSONPlaceholderClient
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import Foundation

class URLSessionAPI: API {
    
    let endpoint: URL
    
    init(endpoint: URL) {
        self.endpoint = endpoint
        
        self.session = URLSession(configuration: .default)
    }
    
    override func makeUsersAPIRequest() -> UsersAPIRequest {
        let request = URLSessionUsersAPIRequest()
        
        let usersURL = endpoint.appendingPathComponent("users")
        
        let task = session.dataTask(with: usersURL) { data, response, error in
            if let error = error {
                request.error = error
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let users = try decoder.decode([User].self, from: data)
                    request.users = users
                } catch {
                    request.error = error
                }
            }
            
            request.complete()
        }
        
        request.task = task
        
        return request
    }
    
    private var session: URLSession
}
