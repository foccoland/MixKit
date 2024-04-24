//
//  Color+Ext.swift
//  MixKit
//
//  Created by Fabio Giannelli on 22/09/23.
//

import SwiftUI

extension Color {
//    static let brandBlack = Color(cgColor: CGColor(red: 48, green: 48, blue: 48, alpha: 0))
//    static let brandPurple = Color(cgColor: CGColor(red: 172, green: 157, blue: 206, alpha: 0))
    
    internal enum Global {
        static var primary: Color {
            Color("brandPrimaryColor")
        }
        
        static var background: Color {
            Color("brandBackgroundColor")
        }
        
        static var shadow: Color {
            Color("brandForegroundShadowColor")
        }
    }
    
    internal enum Button {
        static var text: Color {
            return Color("brandForegroundButtonTextColor")
        }
    }
    
    internal enum TextField {
        static var background: Color {
            Color("brandTextFieldBackgroundColor")
        }
    }
    
    internal enum Text {
        static var primary: Color {
            Color("brandForegroundTextColor")
        }
    }
    
    internal enum Card {
        static var primary: Color {
            Color("brandForegroundCardColor")
        }
    }
    
}
