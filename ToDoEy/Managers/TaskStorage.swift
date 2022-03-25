//
//  TaskStorage.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 3/20/22.
//

import Combine
import CoreData
import Foundation

final class TaskStorage: NSObject, ObservableObject {
    var tasks = CurrentValueSubject<[Task], Never>([])
    private let taskFetchController: NSFetchedResultsController<Task>
    private let context: NSManagedObjectContext
    static let shared = TaskStorage()
    
    private override init() {
        context = DataController.shared.container.viewContext
        
        let fetchRequest = Task.fetchRequest()
        fetchRequest.sortDescriptors = []
        
        taskFetchController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        super.init()
        
        taskFetchController.delegate = self
        
        do {
            try taskFetchController.performFetch()
            tasks.value = taskFetchController.fetchedObjects ?? []
        } catch {
            print("Error: could not fetch tasks")
        }
    }
    
    func add(userInput: String) {
        let newTask = Task(context: context)
        newTask.id = UUID()
        newTask.name = userInput
        newTask.isChecked = false
        
        try? context.save()
    }
    
    func update(withId id: UUID, isChecked: Bool) {
        let task = tasks.value.first { task in
            task.id == id
        }!
        task.isChecked = !isChecked
        
        try? context.save()
    }
    
    func delete(at offsets: IndexSet) {
        for offset in offsets {
            let task = tasks.value[offset]
            context.delete(task)
        }
        
        try? context.save()
    }
}

extension TaskStorage: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let tasks = controller.fetchedObjects as? [Task] else { return }
        print("Context has changed, reloading tasks")
        
        self.tasks.value = tasks
    }
}
