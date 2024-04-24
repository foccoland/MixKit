//
//  Text+Ext.swift
//  MixKit
//
//  Created by Fabio Giannelli on 24/09/23.
//

import SwiftUI

struct StyledText: ViewModifier {
    
    var size: FontSize = .medium
    var weight: FontWeight = .regular
    var color: Color? = .primary
    var fontType: Font {
        switch weight {
        case .regular:
            return Font.SpaceMono.regular(size)
        case .bold:
            return Font.SpaceMono.bold(size)
        case .italic:
            return Font.SpaceMono.italic(size)
        case .boldItalic:
            return Font.SpaceMono.boldItalic(size)
        }
    }
    
    func body(content: Content) -> some View {
        content
            .font(fontType)
            .foregroundColor(color)
    }
}

extension View {
    
    func caption(_ color: Color? = nil) -> some View {
        modifier(StyledText(size: .verySmall, color: color))
    }
    func small(_ color: Color? = nil) -> some View {
        modifier(StyledText(size: .small, color: color))
    }
    func normal(_ color: Color? = nil) -> some View {
        modifier(StyledText(color: color))
    }
    func navBarTitle(_ color: Color? = nil) -> some View {
        modifier(StyledText(weight: .bold, color: color))
    }
    func large(_ color: Color? = nil) -> some View {
        modifier(StyledText(size: .large, weight: .bold, color: color))
    }
    func veryLarge(_ color: Color? = nil) -> some View {
        modifier(StyledText(size: .veryLarge, weight: .bold, color: color))
    }
    func big(_ color: Color? = nil) -> some View {
        modifier(StyledText(size: .big, weight: .bold, color: color))
    }
    func veryBig(_ color: Color? = nil) -> some View {
        modifier(StyledText(size: .veryBig, weight: .bold, color: color))
    }
    
    func styled(style: MVTextStyle, color: Color? = .Text.primary) -> some View {
        switch style {
        case .caption:
            return AnyView(self.caption(color))
        case .small:
            return AnyView(self.small(color))
        case .normal:
            return AnyView(self.normal(color))
        case .navBarTitle:
            return AnyView(self.navBarTitle(color))
        case .large:
            return AnyView(self.large(color))
        case .veryLarge:
            return AnyView(self.veryLarge(color))
        case .big:
            return AnyView(self.big(color))
        case .veryBig:
            return AnyView(self.veryBig(color))
        }
    }
}
