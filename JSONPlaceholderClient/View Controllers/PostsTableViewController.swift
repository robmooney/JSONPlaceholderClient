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
    
    var user: User!
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "@\(user.username!)"
        
        postsAPIRequest = api.makePostsAPIRequest(forUser: user)
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostCell

        let post = posts[indexPath.row]
        
        cell.titleLabel?.text = post.title
        cell.bodyLabel?.text = post.body

        return cell
    }

    private var postsAPIRequest: PostsAPIRequest!
}
