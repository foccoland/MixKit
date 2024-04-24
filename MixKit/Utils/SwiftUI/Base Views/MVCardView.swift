//
//  MVCardView.swift
//  MixKit
//
//  Created by Fabio Giannelli on 29/09/23.
//

import SwiftUI

struct MVCardView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.Card.primary)
            .cornerRadius(20)
            .shadow(color: .Global.shadow, radius: 6, x: 0, y: 0)
            .overlay(alignment: .topLeading) {
                VStack(alignment: .leading) {
                    MVText("Nuovo evento", style: .veryLarge)
                    MVText("tanta descrizione asdasd tanta descrizione tanta descrizione asd tanta descrizione tanta descrizione tanta descrizione asd tanta descrizione tanta descrizione tanta descrizione ", style: .small)
                        .multilineTextAlignment(.leading)
//                        .fixedSize(horizontal: false, vertical: true)
                }.padding()
            }
            .frame(height: 200)
            .padding([.top, .horizontal])
        
    }
}

struct MVCardView_Previews: PreviewProvider {
    static var previews: some View {
        MVView {
            ScrollView {
                LazyVStack {
                    ForEach(0..<100) { _ in
                        NavigationLink(destination: Color.red) {
                            MVCardView()
                        }
                    }
                }
            }
        }
    }
}
