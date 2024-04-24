//
//  MVView.swift
//  MixKit
//
//  Created by Fabio Giannelli on 25/09/23.
//

import SwiftUI

struct MVView<Content : View>: View {
    
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color.Global.background
                .ignoresSafeArea()
            content
        }
    }
}

struct MVView_Previews: PreviewProvider {
    static var previews: some View {
        MVView {
            MVText("Hello!")
        }
    }
}
