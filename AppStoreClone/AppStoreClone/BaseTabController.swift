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
        redNavController.tabBarItem.title = "RED NAV"
        redNavController.navigationBar.prefersLargeTitles = true
        
        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = .blue
        blueViewController.navigationItem.title = "Search"
        
        
        let blueNavController = UINavigationController(rootViewController: blueViewController)
        blueNavController.tabBarItem.title = "BLUE NAV"
        blueNavController.navigationBar.prefersLargeTitles = true
        
        let yellowViewController = UIViewController()
        yellowViewController.view.backgroundColor = .yellow
        yellowViewController.navigationItem.title = "Today"
        
        let yellowNavController = UINavigationController(rootViewController: yellowViewController)
        yellowNavController.tabBarItem.title = "YELLOW NAV"
        yellowNavController.navigationBar.prefersLargeTitles = true
        
        viewControllers = [
        
            redNavController,
            blueNavController,
            yellowNavController
        ]
    }
}
