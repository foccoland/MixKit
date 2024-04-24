//
//  MVText.swift
//  MixKit
//
//  Created by Fabio Giannelli on 26/09/23.
//

import SwiftUI

enum MVTextStyle {
    case caption
    case small
    case normal
    case navBarTitle
    case large
    case veryLarge
    case big
    case veryBig
}

struct MVText: View {
    
    var string: String
    var style: MVTextStyle = .normal
    var color: Color = .Text.primary
    
    init(
        _ string: String,
        style: MVTextStyle = .normal,
        color: Color = .Text.primary
    ) {
        self.string = string
        self.style = style
        self.color = color
    }
    
    var body: some View {
        Text(string)
            .foregroundColor(color)
            .styled(style: style, color: color)
    }
}

struct MVText_Previews: PreviewProvider {
    static var previews: some View {
        MVText("Hello!", style: .large, color: .Text.primary)
    }
}
