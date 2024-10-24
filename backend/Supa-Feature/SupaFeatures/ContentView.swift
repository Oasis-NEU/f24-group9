//
//  ContentView.swift
//  SupaFeatures
//
//  Created by Mikaela Caron on 7/23/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.tasks) { task in
                    
                    NavigationLink(value: task) {
                        HStack {
                            Text(task.taskName)
                            
                            Spacer()
                            
                            if task.completed {
                                Text("Complete")
                                    .padding(8)
                                    .background {
                                        Capsule()
                                            .foregroundColor(.green)
                                    }
                            }
                        }
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            Task {
                                if let id = task.id {
                                    try await viewModel.deleteFeature(at: id)
                                }
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .navigationTitle("Feature Requests")
            .navigationDestination(for: Tasks.self) { task in
                UpdateView(viewModel: viewModel, task: task)
            }
            .toolbar {
                if viewModel.isAuthenticated {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            Task {
                                try await viewModel.signOut()
                                await viewModel.isUserAuthenticated()
                            }
                        } label: {
                            Text("Sign Out")
                        }
                    }
                    
                    ToolbarItem {
                        NavigationLink {
                            AddView(viewModel: viewModel)
                        } label: {
                            Label("Add", systemImage: "plus")
                        }
                    }
                } else {
                    ToolbarItem {
                        Button {
                            viewModel.showingAuthView.toggle()
                        } label: {
                            Label("Add", systemImage: "plus")
                        }
                    }
                }
            }
            .task {
                try? await viewModel.fetchTaskRequests()
            }
            .task {
                await viewModel.isUserAuthenticated()
            }
            .sheet(isPresented: $viewModel.showingAuthView) {
                Task {
                    await viewModel.isUserAuthenticated()
                }
            } content: {
                AuthView(viewModel: viewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
