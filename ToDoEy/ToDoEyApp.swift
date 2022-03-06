//
//  ToDoEyApp.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/17/22.
//

import SwiftUI

@main
struct ToDoEyApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
