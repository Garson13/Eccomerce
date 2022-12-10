//
//  TabBarController.swift
//  Ecommerce Concept
//
//  Created by Гарик on 02.12.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewControllers = [
            setViews(viewController: UINavigationController(rootViewController: MainScreen()), image: UIImage(named: "Explorer")),
            setViews(viewController: UINavigationController(rootViewController: MyCart()), image: UIImage(named: "Cart")),
            setViews(viewController: Favorites(), image: UIImage(named: "Favorites")),
            setViews(viewController: PersonalArea(), image: UIImage(named: "Person"))
        ]
        tabBarDesign()
    }
    
    private func setViews(viewController: UIViewController, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.image = image
        return viewController
    }
    
    
    private func tabBarDesign() {
        tabBar.tintColor = .white
        tabBar.barTintColor = .white
        
        let layer = CAShapeLayer()

        let bezier = UIBezierPath(roundedRect: CGRect(x: tabBar.bounds.minX - 5, y: tabBar.bounds.minY - 15, width: tabBar.bounds.width + 12, height: tabBar.bounds.height + 50), cornerRadius: 30)
        
        layer.path = bezier.cgPath
        layer.fillColor = UIColor(named: "010035")?.cgColor
        
        tabBar.layer.insertSublayer(layer, at: 0)
    }
}
