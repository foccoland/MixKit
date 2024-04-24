//
//  BaseViewController.swift
//  MixKit
//
//  Created by Fabio Giannelli on 22/09/23.
//

import UIKit
import SwiftUI

class SwiftUIHostingBaseViewController: UIViewController {

    var coordinator: Coordinator? = nil

    let swiftUiView: any View
    var navBarTitle: String? = nil
    
    required init(_ swiftUiView: any View) {
        self.swiftUiView = swiftUiView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = navBarTitle
        self.navigationItem.hidesBackButton = true
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showNavBar()
    }
    
    private func showNavBar() {
        coordinator?.navigationController.navigationBar.isHidden = true
    }
    
    open func setup() {
        view.backgroundColor = .Global.background
        attachSwiftUIView(swiftUiView)
    }
}
