//
//  AddTaskViewModel.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/19/22.
//

import CoreData
import Foundation

final class AddTaskViewModel: ObservableObject {
    @Published var userInput = ""
    
    private let context: NSManagedObjectContext
    
    init() {
        context = DataController.shared.container.viewContext
    }
    
    func addNewTask() -> Void {
        TaskStorage.shared.add(userInput: userInput)
    }
}
