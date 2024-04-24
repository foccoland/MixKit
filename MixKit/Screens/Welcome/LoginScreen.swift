//
//  LoginScreen.swift
//  MixKit
//
//  Created by Fabio Giannelli on 26/09/23.
//

import SwiftUI

struct LoginScreen: View {
    
    var goBack: () -> ()
    var goToDashboard: () -> ()
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        MVView {
            VStack(spacing: 40) {
                
                VStack {
                    Image.logo
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        .shadow(color: .black, radius: 50)
                    
                    Text("MixKit")
                        .font(.SpaceMono.bold(.big))
                        .foregroundColor(.Global.primary)
                }
                
                
                VStack {
                    MVTextField(input: $email, hint: "Email")
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        
                    MVSecureField(input: $password, hint: "Password")
                        .textInputAutocapitalization(.never)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                }
                
                MVButton("Login", action: goToDashboard)
                
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen(goBack: {}, goToDashboard: {})
    }
}
