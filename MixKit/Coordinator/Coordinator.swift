//
//  Coordinator.swift
//  MixKit
//
//  Created by Fabio Giannelli on 24/09/23.
//

import UIKit
import SwiftUI

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    init(navigationController: UINavigationController)
    
    func start()
    func pop()
}

extension Coordinator {
    
    func goTo(_ vcType: SwiftUIHostingBaseViewController.Type, view: any View) {
        if let alreadyExistingVCInNavController = navigationController.children.first(where: { type(of: $0) == vcType }) {
            navigationController.popToViewController(alreadyExistingVCInNavController, animated: true)
        } else {
            let vc = vcType.init(view)
            vc.coordinator = self
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func pop() {
        if navigationController.children.count > 1 {
            navigationController.popViewController(animated: true)
        }
    }
}
