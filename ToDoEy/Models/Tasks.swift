//
//  Tasks.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/20/22.
//

import Foundation

class Tasks: ObservableObject {
    
    @Published var items = [Task]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Tasks")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Tasks") {
            if let decodedItems = try? JSONDecoder().decode([Task].self, from: savedItems) {
                items = decodedItems
                return
            }
            
            items = []
        }
    }
}
