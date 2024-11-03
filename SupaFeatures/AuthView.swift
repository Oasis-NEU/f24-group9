//
//  AuthView.swift
//  SupaFeatures
//
//  Created by Mikaela Caron on 7/25/23.
//

import SwiftUI

struct AuthView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            NavigationStack {
                ZStack {
                    // Background Image
                    Image("signupbackground")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea() // Makes the image cover the whole screen
                    
                    // Overlay Content
                    VStack(spacing: 20) {
                        
                        Text("Welcome to Chore Champ!")
                        
                        Picker("Sign Up or Sign In", selection: $viewModel.authAction) {
                            ForEach(AuthAction.allCases, id: \.rawValue) { action in
                                Text(action.rawValue).tag(action)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal)

                        TextField("Email", text: $viewModel.email)
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(8)
                            .padding(.horizontal)

                        SecureField("Password", text: $viewModel.password)
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(8)
                            .padding(.horizontal)

                        // Button for Signing In or Signing Up
                        Button {
                            Task {
                                try await viewModel.authorize()
                                dismiss()
                            }
                        } label: {
                            Text(viewModel.authAction.rawValue)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    } //vstack ends here
                } //zstack ends here
            }
        }
    
    
} //view ends here

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(viewModel: ViewModel())
    }
}
