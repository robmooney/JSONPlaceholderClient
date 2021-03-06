//
//  UsersTableViewController.swift
//  JSONPlaceholderClient
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {
    
    var api: API!
    
    var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        usersAPIRequest = api.makeUsersAPIRequest()
        
        usersAPIRequest.completion = { [weak self] users, error in
            if let users = users {
                DispatchQueue.main.async {
                    self?.users = users
                    self?.tableView.reloadData()
                }
            }
        }
        
        usersAPIRequest.resume()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell

        let user = users[indexPath.row]
        
        cell.nameLabel?.text = user.name
        cell.usernameLabel?.text = "@\(user.username!)"
        cell.emailButton.setTitle(user.email, for: .normal)
        cell.addressLabel?.text = user.address?.description

        return cell
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userPosts" {
            let postsTableViewController = segue.destination as! PostsTableViewController
            postsTableViewController.api = api
            
            let index = tableView.indexPathForSelectedRow!.row
            
            postsTableViewController.user = users[index]
        }
    }
    
    private var usersAPIRequest: UsersAPIRequest!

}
