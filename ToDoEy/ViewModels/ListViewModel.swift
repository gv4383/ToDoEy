//
//  ListViewModel.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/19/22.
//

import Foundation

final class ListViewModel: ObservableObject {
    
    @Published var isShowing = false
    @Published var testTasks = [
        Task(name: "Test Task 1"),
        Task(name: "Test Task 2"),
        Task(name: "Test Task 3")
    ]
    
    func removeTask(at offsets: IndexSet) {
        testTasks.remove(atOffsets: offsets)
    }
}
