//
//  LoginScreen.swift
//  choreChamp_frontEnd
//
//  Created by Jayden Ngo on 10/15/24.
//
import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            TextField("Enter Username", text: $username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 10)
            
            SecureField("Enter Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 20)
            
            NavigationLink(destination: ContentView()) {
                Text("LOGIN")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("Login")
    }
}
