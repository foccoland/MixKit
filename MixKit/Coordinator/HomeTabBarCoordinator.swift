//
//  HomeTabBarCoordinator.swift
//  MixKit
//
//  Created by Fabio Giannelli on 27/09/23.
//

import UIKit

class HomeTabBarCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        goToDashboard()
    }
    
    func goToDashboard() {
        goTo(EventsViewController.self, view: EventsScreen())
    }
}
