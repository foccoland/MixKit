//
//  UIColor.swift
//  MixKit
//
//  Created by Fabio Giannelli on 25/09/23.
//

import UIKit

extension UIColor {
    internal enum Global {
        static var background: UIColor {
            UIColor(named: "brandBackgroundColor")!
        }
        static var primary: UIColor {
            UIColor(named: "brandPrimaryColor")!
        }
        static var shadow: UIColor {
            UIColor(named: "brandForegroundShadowColor")!
        }
    }
    
    internal enum Text {
        static var primary: UIColor {
            UIColor(named: "brandForegroundTextColor")!
        }
    }
    
    internal enum Card {
        static var primary: UIColor {
            UIColor(named: "brandForegroundCardColor")!
        }
    }
}
