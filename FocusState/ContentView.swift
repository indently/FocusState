//
//  ContentView.swift
//  FocusState
//
//  Created by Federico on 10/05/2022.
//

import SwiftUI

enum FocusText {
    case username, password
}

struct ContentView: View {
    @FocusState private var focusField: FocusText?
    @State private var usernameText = ""
    @State private var passwordText = ""
    @State private var submittedText = "This will display your credentials."
    
    var body: some View {
        Form() {
            Section("Credentials") {
                TextField("Enter a username", text: $usernameText)
                    .focused($focusField, equals: .username)
                    .submitLabel(.next)
                    .onSubmit {
                        focusField = .password
                    }
                TextField("Enter a password", text: $passwordText)
                    .focused($focusField, equals: .password)
                    .submitLabel(.done)
                    .onSubmit {
                        submitData()
                    }
            }
            Section("Submitted") {
                Text(submittedText)
            }
        }
        
    }
    
    func submitData() {
        focusField = nil
        submittedText = "\(usernameText), \(passwordText)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
