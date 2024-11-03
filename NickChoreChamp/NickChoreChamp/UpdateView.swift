//
//  UpdateView.swift
//  NickChoreChamp
//
//  Created by Nick Chen on 11/2/24.
//

import Foundation
import SwiftUI

struct UpdateView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    let task: Tasks
    
    @State private var text = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            TextField("Feature Description", text: $text, axis: .vertical)
        }
        .onAppear {
            text = task.taskName
        }
        .toolbar {
            ToolbarItem {
                Button {
                    Task {
                        await viewModel.update(task, with: text)
                        dismiss()
                    }
                } label: {
                    Text("Update")
                }
            }
        }
    }
}
