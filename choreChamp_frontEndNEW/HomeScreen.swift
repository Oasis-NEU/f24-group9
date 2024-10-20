//
//  HomeScreen.swift
//  choreChamp_frontEnd
//
//  Created by Jayden Ngo on 10/15/24.
//

import Foundation
import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to ChoreChamp!")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination: LoginView()) {
                    Text("Login")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Home")
        }
    }
}
