//
//  DashboardCoordinator.swift
//  MixKit
//
//  Created by Fabio Giannelli on 27/09/23.
//

import UIKit

class DashboardCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        goToHome()
    }
    
    func goToHome() {
        let vc = HomeTabBarController.init()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
