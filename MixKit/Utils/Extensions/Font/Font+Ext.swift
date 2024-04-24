//
//  Font+Ext.swift
//  MixKit
//
//  Created by Fabio Giannelli on 22/09/23.
//

import SwiftUI

extension Font {
    
    private static func get(_ size: FontSize, fontWeight: FontWeight) -> SwiftUI.Font {
        guard !FontName.name.isEmpty else {
            return SwiftUI.Font.system(size: size.rawValue, weight: fontWeight.toSwiftUIWeight)
        }
        
        return SwiftUI.Font.custom("\(FontName.name)-\(fontWeight.rawValue)", size: size.rawValue)
    }
    
    internal enum SpaceMono {
        
        internal static func regular(_ size: FontSize) -> SwiftUI.Font {
            return Font.get(size, fontWeight: .regular)
        }
        
        internal static func bold(_ size: FontSize) -> SwiftUI.Font {
            return Font.get(size, fontWeight: .bold)
        }
        
        internal static func italic(_ size: FontSize) -> SwiftUI.Font {
            return Font.get(size, fontWeight: .italic)
        }
        
        internal static func boldItalic(_ size: FontSize) -> SwiftUI.Font {
            return Font.get(size, fontWeight: .boldItalic)
        }
    }
}
