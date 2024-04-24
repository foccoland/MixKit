//
//  SplashScreen.swift
//  MixKit
//
//  Created by Fabio Giannelli on 22/09/23.
//

import SwiftUI

struct SplashScreen: View {
    
    var goToTutorial: () -> ()
    
    var body: some View {
        
        MVView {
            VStack {
                MVText("Welcome to \nMixKit!", style: .veryBig)
                    .multilineTextAlignment(.center)
                
                MVButton(
                    "Get Started",
                    action: goToTutorial
                )
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen(goToTutorial: { })
    }
}
