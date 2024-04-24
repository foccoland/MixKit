//
//  HomeTabBarController.swift
//  MixKit
//
//  Created by Fabio Giannelli on 27/09/23.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    var coordinator: Coordinator? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupTabBar()
        showNavBar()
    }
    
    private func showNavBar() {
        guard let coordinator = coordinator else { return }
        coordinator.navigationController.navigationBar.isHidden = false
    }
    
    private func setupTabBar() {
        if let coordinator = coordinator as? DashboardCoordinator {
                        
            view.backgroundColor = .Global.background
            tabBar.isTranslucent = false
            tabBar.tintColor = .Global.primary
            
            coordinator.navigationController.navigationItem.title = "title"
            
            let eventsViewController = EventsViewController(EventsScreen())
            eventsViewController.tabBarItem.title = "Events"
            eventsViewController.tabBarItem.image = UIImage(named: "magnifyingglass")

            let profileViewController = ProfileViewController(ProfileScreen())
            profileViewController.tabBarItem.title = "Profile"
            profileViewController.tabBarItem.image = UIImage(named: "person")

            let hostViewController = HostViewController(HostScreen())
            hostViewController.tabBarItem.title = "Host"
            hostViewController.tabBarItem.image = UIImage(named: "star")

            let settingsViewController = SettingsViewController(SettingsScreen())
            settingsViewController.tabBarItem.title = "Settings"
            settingsViewController.tabBarItem.image = UIImage(named: "settings")

            viewControllers = [
                eventsViewController,
                profileViewController,
                hostViewController,
                settingsViewController
            ]
            
            self.title = eventsViewController.tabBarItem.title
        }
    }
}

extension HomeTabBarController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.title = item.title
    }
}
