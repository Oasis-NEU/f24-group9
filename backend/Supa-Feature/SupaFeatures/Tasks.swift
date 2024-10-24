//
//  Feature.swift
//  SupaFeatures
//
//  Created by Mikaela Caron on 7/23/23.
//

import Foundation

struct Tasks: Codable, Identifiable, Hashable {
    var id: Int?
    var taskName: String
    var createdAt: Date
    var dueDate: Date
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
