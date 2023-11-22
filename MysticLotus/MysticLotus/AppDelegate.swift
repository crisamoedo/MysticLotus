//
//  AppDelegate.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 31/10/23.
//


import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        let randomCardNavigationController = UINavigationController()
        let randomCardCoordinator = RandomCardCoordinator(navigationController: randomCardNavigationController)
        randomCardNavigationController.setViewControllers(
            [randomCardCoordinator.build()], animated: false)
        randomCardNavigationController.tabBarItem.title = "Random card"
        randomCardNavigationController.tabBarItem.image = UIImage(systemName: "circle.hexagonpath")
        
        let cardDataNavigationController = UINavigationController()
        let searchCardCoordinator =
        SearchDataCardCoordinator(navigationController: cardDataNavigationController)
        cardDataNavigationController.setViewControllers(
            [searchCardCoordinator.build()], animated: false)
        cardDataNavigationController.tabBarItem.title = "Search card"
        cardDataNavigationController.tabBarItem.image = UIImage(systemName: "plus.magnifyingglass")
        
        let tabBar = UITabBarController()
        
        tabBar.setViewControllers([cardDataNavigationController, randomCardNavigationController], animated: false)
        
        
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        
        return true
    }
}
