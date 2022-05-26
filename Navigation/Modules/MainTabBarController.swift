//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Александр Зинин on 25.05.2022.
//

import UIKit

//let colorSet = UIColor(hex: 0x4885CC)

class MainTabBarController: UITabBarController {

    private enum MainTabBarItem {
        case feed
        case profile
        
        var title: String {
            switch self {
            case .feed:
                return "Feed"
            case .profile:
                return "Profile"
            }
        }
        
        var image: UIImage? {
            switch self {
            case .feed:
                return UIImage(systemName: "house.fill")
            case .profile:
                return UIImage(systemName: "person.fill")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        let items: [MainTabBarItem] = [.feed, .profile]
        
        self.viewControllers = items.map ({ tabBarItem in
            switch tabBarItem {
            case .profile:
                return UINavigationController(rootViewController: LogInViewController())
            case .feed:
                return UINavigationController(rootViewController: FeedViewController())
            }
        })
        
        self.viewControllers?.enumerated().forEach({(index, vc) in
            vc.tabBarItem.title = items[index].title
            vc.tabBarItem.image = items[index].image
        })
    }
}

//// MARK: - перевод цвета из HEX в RGB для UIColor
//extension UIColor {
//    convenience init(hex: Int) {
//        let components = (
//            R: CGFloat((hex >> 16) & 0xff) / 255,
//            G: CGFloat((hex >> 08) & 0xff) / 255,
//            B: CGFloat((hex >> 00) & 0xff) / 255
//        )
//        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
//    }
//}
