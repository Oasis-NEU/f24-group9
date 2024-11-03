//
//  ContentView.swift
//  NickChoreChamp
//
//  Created by Nick Chen on 11/2/24.
//

import SwiftUI
import Supabase

struct ContentView: View {
    let supabase = SupabaseClient(supabaseURL: Secrets.projectURL, supabaseKey: Secrets.apiKey)
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        Group {
            if viewModel.isAuthenticated {
                TasksView();
            }
            else {
                AuthView(viewModel: viewModel)
            }
        }
        .task {
          for await state in supabase.auth.authStateChanges {
            await viewModel.isUserAuthenticated();
          }
        }
    }
}

#Preview {
    ContentView()
}
