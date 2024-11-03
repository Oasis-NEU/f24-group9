//
//  Tasks.swift
//  NickChoreChamp
//
//  Created by Nick Chen on 11/2/24.
//

import Foundation

struct Tasks: Codable, Identifiable, Hashable {
    var id: Int?
    var taskName: String
    var createdAt: String
    var dueDate: String
    var completed: Bool
    var userID: String
    
    enum CodingKeys: String, CodingKey {
        case completed
        case dueDate = "due_date"
        case taskName = "task_name"
        case id = "task_id"
        case createdAt = "created_at"
        case userID = "user_id"
    }
}

