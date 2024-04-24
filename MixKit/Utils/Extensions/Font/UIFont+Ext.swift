//
//  UIFont+Ext.swift
//  MixKit
//
//  Created by Fabio Giannelli on 29/09/23.
//

import UIKit

extension UIFont {
    
    private static func get(_ size: FontSize, fontWeight: FontWeight) -> UIFont {
        let fallbackFont: UIFont = UIFont.systemFont(ofSize: size.rawValue, weight: fontWeight.toUIKitWeight)
        
        guard !FontName.name.isEmpty else {
            return fallbackFont
        }
        
        return UIFont(name: "\(FontName.name)-\(fontWeight.rawValue)", size: size.rawValue) ?? fallbackFont
    }
    
    internal enum SpaceMono {
        
        internal static func regular(_ size: FontSize) -> UIFont {
            return UIFont.get(size, fontWeight: .regular)
        }
        
        internal static func bold(_ size: FontSize) -> UIFont {
            return UIFont.get(size, fontWeight: .bold)
        }
        
        internal static func italic(_ size: FontSize) -> UIFont {
            return UIFont.get(size, fontWeight: .italic)
        }
        
        internal static func boldItalic(_ size: FontSize) -> UIFont {
            return UIFont.get(size, fontWeight: .boldItalic)
        }
    }
}
