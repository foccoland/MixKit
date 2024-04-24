//
//  SceneDelegate.swift
//  MixKit
//
//  Created by Fabio Giannelli on 22/09/23.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let navController = UINavigationController()

        // send that into our coordinator so that it can display view controllers
        coordinator = MainCoordinator(navigationController: navController)

        // tell the coordinator to take over control
        coordinator?.start()
        customizeUI()

        // create a basic UIWindow and activate it
        self.window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

extension SceneDelegate {
    func customizeUI() {
        
        let uiNavBarNormalTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.Global.primary,
            NSAttributedString.Key.font : UIFont.SpaceMono.bold(.medium)
        ]
        
        // UIBarButtonItem appearance
        let uiNavBarLargeTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.Global.primary,
            NSAttributedString.Key.font : UIFont.SpaceMono.bold(.big)
        ]
        
        // UIBarButtonItem appearance
        let uiBarButtonAttributes = [
            NSAttributedString.Key.font : UIFont(name: "SpaceMono-Bold", size: 17) as Any,
            NSAttributedString.Key.foregroundColor : UIColor.Global.primary
        ]
        
        // UISegmentedControl selected text attributes
        let uiSegmentedControlSelectedAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(Color.Button.text),
            NSAttributedString.Key.font: UIFont.SpaceMono.bold(.small)
        ]
        
        // UISegmentedControl normal text attributes
        let uiSegmentedControlNormalAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(Color.Text.primary),
            NSAttributedString.Key.font: UIFont.SpaceMono.bold(.small)
        ]
        
        // UINavigationBar appearance
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = uiNavBarNormalTextAttributes
        navBarAppearance.largeTitleTextAttributes = uiNavBarLargeTextAttributes
        
        // UINavigationBarBackButton appearance
        let uiBarBackButtonAppearance = UIBarButtonItemAppearance()
        uiBarBackButtonAppearance.normal.titleTextAttributes = uiBarButtonAttributes
        navBarAppearance.backButtonAppearance = uiBarBackButtonAppearance
        
        // UISegmentedControl appearance
        UISegmentedControl.appearance().backgroundColor = .clear
        UISegmentedControl.appearance().setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        UISegmentedControl.appearance().selectedSegmentTintColor = .Global.primary
        UISegmentedControl.appearance().setTitleTextAttributes(uiSegmentedControlSelectedAttributes, for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(uiSegmentedControlNormalAttributes, for: .normal)

        // UITabBarAppearance
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor.Global.background
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.font: UIFont.SpaceMono.bold(.verySmall)]
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.font: UIFont.SpaceMono.bold(.verySmall)]
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                
        // UIBarButtonItem appearance
        UIBarButtonItem.appearance().setTitleTextAttributes(uiBarButtonAttributes, for: .normal)
        
        guard let coordinator = coordinator else { return }
        
        coordinator.navigationController.navigationItem.backBarButtonItem?.setTitleTextAttributes(uiBarButtonAttributes, for: .normal)

        coordinator.navigationController.navigationBar.prefersLargeTitles = true
        coordinator.navigationController.navigationBar.isHidden = true
        coordinator.navigationController.navigationBar.standardAppearance = navBarAppearance
        coordinator.navigationController.navigationBar.compactAppearance = navBarAppearance
        coordinator.navigationController.navigationBar.compactScrollEdgeAppearance = navBarAppearance
        coordinator.navigationController.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        
    }
}

