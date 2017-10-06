//
//  UsersTableViewController.swift
//  JSONPlaceholderClient
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {
    
    var api: JSONPlaceholderAPI!
    
    var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let usersRequest = api.makeUsersRequest()
        
        usersRequest.completion = { users, error in
            if let users = users {
                DispatchQueue.main.async {
                    self.users = users
                    self.tableView.reloadData()
                }
            }
        }
        
        usersRequest.resume()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)

        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email

        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
