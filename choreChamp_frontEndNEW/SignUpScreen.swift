//
//  SignUpScreen.swift
//  choreChamp_frontEnd
//
//  Created by Jayden Ngo on 10/15/24.
//
import SwiftUI

struct SignUpView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var email = ""

    var body: some View {
        VStack {
            TextField("Enter a new Username", text: $username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 10)

            TextField("Enter Email", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 10)
            
            SecureField("Enter new Password (8 char. minimum) ", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 20)
            
            NavigationLink(destination: ContentView()) {
                Text("SIGN UP")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("Sign Up")
    }
}
