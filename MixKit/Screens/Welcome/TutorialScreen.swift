//
//  TutorialScreen.swift
//  MixKit
//
//  Created by Fabio Giannelli on 24/09/23.
//

import SwiftUI

struct TutorialScreen: View {
    @State private var index = 0
    var goBack: () -> ()
    var goToLogin: () -> ()
    
    var codeView: some View {
        VStack(alignment: .leading) {
            
            Spacer()
            
            Group {
                MVText("This is...", style: .large)
                MVText("...An Example", style: .large)
            }
            .opacity(1.0)

            
            Group {
                MVText("...of how", style: .large)
                MVText("can we show...", style: .large)
            }
            .opacity(index > 0 ? 1.0 : 0.0)

            Group {
                MVText("...instructions on", style: .large)
                MVText("a tutorial page", style: .large)
            }
            .opacity(index > 1 ? 1.0 : 0.0)
            
            Group {
                MVText("that could help you!", style: .large)
            }
            .opacity(index > 2 ? 1.0 : 0.0)
            
            Spacer()

        }
    }
    
    var body: some View {
        MVView {
            VStack {
                
                Spacer()
                                
                codeView

                TabView(selection: $index) {
                    ForEach((0..<4), id: \.self) { index in
                        Spacer()
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(maxWidth: .infinity)
                .frame(height: 10)

                HStack {
                    MVButton("Skip", style: .init(.secondary), action: goToLogin)
                        .padding()
                    
                    Spacer()
                    
                    MVButton("Next", action: {
                        withAnimation {
                            if index < 3 {
                                index += 1
                            } else {
                                goToLogin()
                            }
                        }
                    })
                    .padding()
                }
                .frame(maxHeight: 100)
            }
        }
    }
}

struct TutorialScreen_Previews: PreviewProvider {
    static var previews: some View {
        TutorialScreen(goBack: {}, goToLogin: {})
    }
}
