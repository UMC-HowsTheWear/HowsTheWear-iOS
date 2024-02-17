//
//  TabBarController.swift
//  HowsTheWear
//
//  Created by RAFA on 1/21/24.
//

import UIKit

import Then

final class TabBarController: UITabBarController {
    
    private let homeVC = HomeViewController().then {
        $0.tabBarItem = UITabBarItem(
            title: "HOME",
            image: UIImage(named: "house"),
            selectedImage: UIImage(named: "house.fill")
        )
    }
    
    private let browseVC = BrowseMainViewController().then {
        $0.tabBarItem = UITabBarItem(
            title: "BROWSE",
            image: UIImage(named: "search"),
            selectedImage: UIImage(named: "search.fill")
        )
    }
    
    private let othersVC = OtherPeopleViewController().then {
        $0.tabBarItem = UITabBarItem(
            title: "OTHERS",
            image: UIImage(named: "user.group"),
            selectedImage: UIImage(named: "user.group.fill")
        )
    }
    
    private let myVC = UIViewController().then {
        $0.tabBarItem = UITabBarItem(
            title: "MY",
            image: UIImage(named: "person.circle"),
            selectedImage: UIImage(named: "person.circle.fill")
        )
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        Vibration.soft.vibrate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    private func configureTabBar() {
        let homeNavController = UINavigationController(rootViewController: homeVC)
        let browseNavController = UINavigationController(rootViewController: browseVC)
        let othersNavController = UINavigationController(rootViewController: othersVC)
        let myNavController = UINavigationController(rootViewController: myVC)

        viewControllers = [homeNavController, browseNavController, othersNavController, myNavController]
        
        setupTabBarAppearance()
    }
    
    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        tabBar.tintColor = .black
        tabBar.layer.masksToBounds = true
        tabBar.layer.borderWidth = 0.1
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.layer.cornerRadius = 20
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
}
