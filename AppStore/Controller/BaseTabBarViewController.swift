//
//  BaseTabBarViewController.swift
//  AppStore
//
//  Created by Manoel Filho on 27/01/21.
//

import UIKit

class BaseTabBarViewController: UITabBarController {
    
    /*
        O padrao desse controlador é o TabBar.
        Iniciamos ele diretamente como padrao em SceneDelegate
        na func scene
     */
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // First -> Create three options of views
        
        /*
        let todayViewController = UIViewController()
        todayViewController.view.backgroundColor = .red
        todayViewController.tabBarItem.title = "Hoje"
        todayViewController.tabBarItem.image = UIImage(named: "icon-today")
        
        let appsViewController = UIViewController()
        appsViewController.view.backgroundColor = .blue
        appsViewController.tabBarItem.title = "Apps"
        appsViewController.tabBarItem.image = UIImage(named: "icon-apps")
        
        let searchViewController = UIViewController()
        searchViewController.view.backgroundColor = .yellow
        searchViewController.tabBarItem.title = "Buscar"
        searchViewController.tabBarItem.image = UIImage(named: "icon-search")
        */
        
        let today = self.createTabBarItem(viewController: TodayViewController(), title: "Hoje", imageName: "icon-today")
        let apps = self.createTabBarItem(viewController: AppsController(), title: "Apps", imageName: "icon-apps")
        let search = self.createTabBarItem(viewController: SearchController(), title: "Buscar", imageName: "icon-search")
        
        // Second -> Add the views to array viewControllers
        // viewControllers is from UITabBarController
        
        viewControllers = [
            today,
            apps,
            search
        ]
        
        // It is the first element of tab
        selectedIndex = 0
        
    }
    
    func createTabBarItem(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        
        navController.navigationBar.prefersLargeTitles = true //Permite o título grande na UI - False fica com o titulo no topo
        
        viewController.navigationItem.title = title
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: imageName)
        viewController.view.backgroundColor = .white
        
        return navController
        
    }
    
}
