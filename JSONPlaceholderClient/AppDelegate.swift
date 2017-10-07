//
//  AppDelegate.swift
//  JSONPlaceholderClient
//
//  Created by Robert Mooney on 06/10/2017.
//  Copyright © 2017 Robert Mooney. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let endpoint = URL(string: "https://jsonplaceholder.typicode.com")!
        
        let api = URLSessionAPI(endpoint: endpoint)
        
        let navigationController = window?.rootViewController as? UINavigationController
        let usersTableViewController = navigationController?.topViewController as? UsersTableViewController
        
        usersTableViewController?.api = api
        
        return true
    }

}

