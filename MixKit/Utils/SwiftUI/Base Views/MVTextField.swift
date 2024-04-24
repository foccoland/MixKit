//
//  MVTextField.swift
//  MixKit
//
//  Created by Fabio Giannelli on 26/09/23.
//

import SwiftUI

struct MVTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(Color.TextField.background)
            .cornerRadius(10)
            .font(.SpaceMono.regular(.medium))
            .tint(.Global.primary)
            .shadow(color: .black.opacity(0.2), radius: 5)
    }
}

struct MVTextField: View {
    
    @Binding var input: String
    var hint: String
    
    var body: some View {
        TextField(hint, text: $input, prompt: Text(hint)
            .foregroundColor(.Global.primary.opacity(0.6)))
            .textFieldStyle(MVTextFieldStyle())
    }
}

struct MVSecureField: View {
    
    @Binding var input: String
    var hint: String
    
    var body: some View {
        SecureField(hint, text: $input, prompt: Text(hint)
            .foregroundColor(.Global.primary.opacity(0.6)))
            .textFieldStyle(MVTextFieldStyle())
    }
}
