//
//  MainCoordinator.swift
//  MixKit
//
//  Created by Fabio Giannelli on 24/09/23.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.delegate = self
        goToWelcomeCoordinator()
    }
    
    func goToWelcomeCoordinator() {
        let child = WelcomeCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func goToDashboardCoordinator() {
        let child = DashboardCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a welcome view controller
        if let welcomeViewController = fromViewController as? WelcomeViewController {
            // We're popping a buy view controller; end its coordinator
            childDidFinish(welcomeViewController.coordinator)
        }
        
        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a welcome view controller
        if let eventsViewController = fromViewController as? EventsViewController {
            // We're popping a buy view controller; end its coordinator
            childDidFinish(eventsViewController.coordinator)
        }
    }
}
