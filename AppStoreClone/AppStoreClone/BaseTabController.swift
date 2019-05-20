//
//  BaseTabController.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 5/20/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation
import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .red
        redViewController.navigationItem.title = "Apps"
        
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.tabBarItem.title = "Apps"
        redNavController.tabBarItem.image = #imageLiteral(resourceName: "apps")
        redNavController.navigationBar.prefersLargeTitles = true
        
        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = .blue
        blueViewController.navigationItem.title = "Today"
        
        
        let blueNavController = UINavigationController(rootViewController: blueViewController)
        blueNavController.tabBarItem.title = "Today"
        blueNavController.tabBarItem.image = #imageLiteral(resourceName: "today_icon")
        blueNavController.navigationBar.prefersLargeTitles = true
        
        let yellowViewController = UIViewController()
        yellowViewController.view.backgroundColor = .yellow
        yellowViewController.navigationItem.title = "Search"
        
        let yellowNavController = UINavigationController(rootViewController: yellowViewController)
        yellowNavController.tabBarItem.title = "Search"
        yellowNavController.tabBarItem.image = #imageLiteral(resourceName: "search")
        yellowNavController.navigationBar.prefersLargeTitles = true
        
        viewControllers = [
        
            redNavController,
            blueNavController,
            yellowNavController
        ]
    }
}
