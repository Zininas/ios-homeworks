//
//  TabBarViewController.swift
//  Navigation
//
//  Created by Александр Зинин on 10.05.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let firstVC = ProfileViewController()
    let secondVC = FeedViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        tabBar.backgroundColor = .systemGray6
        setupControllers()
    }
    
    private func setupControllers() {
                
        let profileController = UINavigationController(rootViewController: firstVC)
        firstVC.tabBarItem.title = "Профиль"
        firstVC.tabBarItem.image = UIImage(systemName: "person")
        firstVC.navigationItem.title = "Профиль"
                                        
        let feedController = UINavigationController(rootViewController: secondVC)
        secondVC.tabBarItem.title = "Лента новостей"
        secondVC.tabBarItem.image = UIImage(systemName: "house")
        secondVC.navigationItem.title = "Лента новостей"
        viewControllers = [feedController, profileController]
    }
    
}
