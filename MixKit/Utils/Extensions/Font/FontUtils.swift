//
//  FontUtils.swift
//  MixKit
//
//  Created by Fabio Giannelli on 08/02/24.
//

import Foundation
import UIKit
import SwiftUI

enum FontName {
    static var name: String = "SpaceMono" // <-- TODO: put font name over here
}

enum FontSize: CGFloat {
    case verySmall  = 10
    case small      = 12
    case medium     = 15
    case large      = 18
    case veryLarge  = 25
    case big        = 30
    case veryBig    = 50
}

enum FontWeight: String {
    case regular    = "Regular"
    case bold       = "Bold"
    case italic     = "Italic"
    case boldItalic = "BoldItalic"
    
    var toSwiftUIWeight: SwiftUI.Font.Weight {
        switch self {
        case .regular:
            SwiftUI.Font.Weight.regular
        case .bold:
            SwiftUI.Font.Weight.bold
        case .italic:
            SwiftUI.Font.Weight.regular
        case .boldItalic:
            SwiftUI.Font.Weight.bold
        }
    }
    
    var toUIKitWeight: UIKit.UIFont.Weight {
        switch self {
        case .regular:
            UIKit.UIFont.Weight.regular
        case .bold:
            UIKit.UIFont.Weight.bold
        case .italic:
            UIKit.UIFont.Weight.regular
        case .boldItalic:
            UIKit.UIFont.Weight.bold
        }
    }
}
