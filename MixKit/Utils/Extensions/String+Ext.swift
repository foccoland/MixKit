//
//  String+Ext.swift
//  MixKit
//
//  Created by Fabio Giannelli on 24/09/23.
//

import UIKit
import SwiftUI

extension String {
    
    func getSwiftUIHostingViewController(_ view: any View) -> SwiftUIHostingBaseViewController? {
        if let appName = Bundle.main.infoDictionary?["CFBundleName"] as? String {
            if let vcType = NSClassFromString("\(appName).\(self)") as? SwiftUIHostingBaseViewController.Type {
                return vcType.init(view)
            }
        }
        return nil
    }
}
