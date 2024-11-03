//
//  TasksView.swift
//  NickChoreChamp
//
//  Created by Nick Chen on 11/2/24.
//

import SwiftUI

struct TasksView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            // List of tasks.
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
                ToolbarItem {
                    NavigationLink {
                        AddView(viewModel: viewModel)
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
            .task {
                try? await viewModel.fetchTaskRequests()
            }
        }
    }
}

#Preview {
    TasksView()
}
