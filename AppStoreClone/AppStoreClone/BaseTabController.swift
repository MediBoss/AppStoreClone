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
    
    
    // 1 - Refactor the repeated logic inside the viewDidLoad()
    // 2 - Introduce AppStoreSearchController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
        
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
            createNavController(viewController: UIViewController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: UIViewController(), title: "Search", imageName: "search"),
        ]
    }
    
    
    /// Configures the navigation controller for a given view controller
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
    
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(named: imageName)
        navigationController.navigationBar.prefersLargeTitles = true
        
        return navigationController
    }
}
