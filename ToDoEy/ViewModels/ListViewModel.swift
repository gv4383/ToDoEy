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
        Task(name: "Test Task 3"),
        Task(name: "Test Task 4"),
        Task(name: "Test Task 5"),
        Task(name: "Test Task 6"),
        Task(name: "Test Task 7"),
        Task(name: "Test Task 8"),
        Task(name: "Test Task 9"),
        Task(name: "Test Task 10"),
        Task(name: "Test Task 11"),
        Task(name: "Test Task 12"),
        Task(name: "Test Task 13"),
        Task(name: "Test Task 14"),
        Task(name: "Test Task 15")
    ]
    
    func removeTask(at offsets: IndexSet) {
        testTasks.remove(atOffsets: offsets)
    }
}
