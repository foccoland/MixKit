//
//  MVButton.swift
//  MixKit
//
//  Created by Fabio Giannelli on 22/09/23.
//

import SwiftUI

enum MVButtonStyleType {
    case primary
    case secondary
}

struct MVButtonStyle: ButtonStyle {
    
    var styleType: MVButtonStyleType = .primary
    
    init(_ styleType: MVButtonStyleType) {
        self.styleType = styleType
    }
    
    func makeBody(configuration: Configuration) -> some View {
        switch styleType {
        case .primary:
            configuration.label
                .font(.SpaceMono.bold(.medium))
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .background(Color.Global.primary)
                .foregroundStyle(Color.Button.text)
                .clipShape(Capsule())
        case .secondary:
            configuration.label
                .font(.SpaceMono.bold(.medium))
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .foregroundStyle(Color.Global.primary)
        }
    }
}

struct MVButton: View {
    
    var title: String
    var action: () -> Void = {}
    var style: MVButtonStyle = MVButtonStyle(.primary)
    
    init(
        _ title: String,
        style: MVButtonStyle = MVButtonStyle(.primary),
        action: @escaping () -> Void = {}
    ) {
        self.title = title
        self.style = style
        self.action = action
    }
    
    var body: some View {
        
        Button(action: action, label: {
            return Text(title)
        })
        .buttonStyle(style)
        .onTapGesture(perform: action)
    }
}

struct MVButton_Previews: PreviewProvider {
    
    static var previews: some View {
        MVButton("Hello", style: .init(.secondary))
    }
}
