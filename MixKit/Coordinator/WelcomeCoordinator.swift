//
//  WelcomeCoordinator.swift
//  MixKit
//
//  Created by Fabio Giannelli on 27/09/23.
//

import UIKit

class WelcomeCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        goTo(WelcomeViewController.self, view: SplashScreen(goToTutorial: goToTutorial))
    }
    
    func goToTutorial() {
        goTo(TutorialViewController.self, view: TutorialScreen(goBack: pop, goToLogin: goToLogin))
    }
    
    func goToLogin() {
        goTo(LoginViewController.self, view: LoginScreen(goBack: pop, goToDashboard: goToDashboard))
    }
    
    func goToDashboard() {
        parentCoordinator?.childDidFinish(self)
        parentCoordinator?.goToDashboardCoordinator()
    }
}
