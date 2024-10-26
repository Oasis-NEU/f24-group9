//
//  ViewModel.swift
//  SupaFeatures
//
//  Created by Mikaela Caron on 7/23/23.
//

import Foundation
import Supabase

enum Table {
    static let features = "Features"
}

enum AuthAction: String, CaseIterable {
    case signUp = "Sign Up"
    case signIn = "Sign In"
}

@MainActor
final class ViewModel: ObservableObject {
    
    @Published var isAuthenticated = false
    @Published var authAction: AuthAction = .signUp
    
    @Published var tasks = [Tasks]()
    
    @Published var showingAuthView = false
    @Published var email = ""
    @Published var password = ""
    
    let supabase = SupabaseClient(supabaseURL: Secrets.projectURL, supabaseKey: Secrets.apiKey)
    
    // MARK: - Database
    
    func createFeatureRequest(text: String) async throws {
    }
    
    func fetchTaskRequests() async throws {
        do {
            let manyTasks: [Tasks] = try await supabase.database
                .from("task_table")
                .select()
                .execute()
                .value
            
            DispatchQueue.main.async {
                self.tasks = manyTasks
            }
        } catch {
            print("error getting task data")
        }
    }
    
    func update(_ feature: Tasks, with text: String) async {
    }
    
    func deleteFeature(at id: Int) async throws {
    }
    
    // MARK: - Authentication
    func signUp() async throws {
        let _ = try await supabase.auth.signUp(email: email, password: password)
    }
    
    func signIn() async throws {
        let _ = try await supabase.auth.signIn(email: email, password: password)
    }
    
    func isUserAuthenticated() async {
        do {
            _ = try await supabase.auth.session.user
            isAuthenticated = true
        } catch {
            isAuthenticated = false
        }
    }
    
    func signOut() async throws {
        try await supabase.auth.signOut()
        isAuthenticated = false
    }
    
    func authorize() async throws {
        switch authAction {
        case .signUp:
            try await signUp()
        case .signIn:
            try await signIn()
        }
    }
}
