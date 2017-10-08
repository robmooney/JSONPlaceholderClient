//
//  PostsTableViewController.swift
//  JSONPlaceholderClient
//
//  Created by Robert Mooney on 08/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {

    var api: API!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        postsAPIRequest = api.makePostsAPIRequest(forUser: User())
        
        postsAPIRequest.completion = { [weak self] posts, error in
            if let posts = posts {
                DispatchQueue.main.async {
                    self?.posts = posts
                    self?.tableView.reloadData()
                }
            }
        }
        
        postsAPIRequest.resume()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)

        let post = posts[indexPath.row]
        
        cell.textLabel?.text = post.title

        return cell
    }

    private var postsAPIRequest: PostsAPIRequest!
}
