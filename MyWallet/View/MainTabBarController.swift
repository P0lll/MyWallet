//
//  MainTabBarController.swift
//  MyWallet
//
//  Created by Pavel Bukatin on 09.10.2023.
//
import SnapKit
import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarSize()
        
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: HomeViewController(),
                       title: "Home",
                       image: UIImage(systemName: "house.fill")
                      ),
            generateVC(viewController: SecondViewController(),
                       title: "Second",
                       image: UIImage(systemName: "person.fill")
                      ),
            generateVC(viewController: ThirdViewController(),
                       title: "Third",
                       image: UIImage(systemName: "slider.horizontak.3")
                      )
        ]
        
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarSize() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(x: positionOnX,
                                y: tabBar.bounds.minY - positionOnY,
                                width: width,
                                height: height
                               ),
            cornerRadius: height / 2)
        
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
    }
}

