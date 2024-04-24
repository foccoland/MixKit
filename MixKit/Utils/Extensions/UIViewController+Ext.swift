//
//  ViewController+Ext.swift
//  MixKit
//
//  Created by Fabio Giannelli on 22/09/23.
//

import UIKit
import SwiftUI

extension UIViewController {
    
    func attachSwiftUIView<T>(_ swiftUiView: T) where T : View {
        let vc = UIHostingController(rootView: swiftUiView)
        
        let swiftUiViewAsUiView = vc.view!
        swiftUiViewAsUiView.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(vc)
        view.addSubview(swiftUiViewAsUiView)
        
        NSLayoutConstraint.activate([
            swiftUiViewAsUiView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swiftUiViewAsUiView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            swiftUiViewAsUiView.topAnchor.constraint(equalTo: view.topAnchor),
            swiftUiViewAsUiView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            swiftUiViewAsUiView.rightAnchor.constraint(equalTo: view.rightAnchor),
            swiftUiViewAsUiView.leftAnchor.constraint(equalTo: view.leftAnchor),

        ])
        
        vc.didMove(toParent: self)
    }
}
