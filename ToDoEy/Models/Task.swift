//
//  TaskModel.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/18/22.
//

import Foundation

struct Task: Identifiable, Codable {
    var id = UUID()
    let name: String
}
