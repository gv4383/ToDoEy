//
//  TaskViewModel.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/23/22.
//

import CoreData
import Foundation

final class TaskViewModel: ObservableObject {
    private let context: NSManagedObjectContext
    
    init() {
        context = DataController.shared.container.viewContext
    }
    
    func getCheckSymbol(isChecked: Bool) -> String {
        return isChecked
            ? "checkmark.circle"
            : "circle"
    }
    
    func toggleTaskCheck(withId id: UUID,isChecked: Bool) {
        TaskStorage.shared.update(withId: id, isChecked: isChecked)
    }
}
