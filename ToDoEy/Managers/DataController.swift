//
//  DataController.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 3/5/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container: NSPersistentContainer
    static let shared = DataController()
    
    private init() {
        container = NSPersistentContainer(name: "ToDoEy")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
