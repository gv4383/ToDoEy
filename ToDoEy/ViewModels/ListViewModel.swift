//
//  ListViewModel.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/19/22.
//

import Combine
import Foundation

final class ListViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var isShowing = false
    
    private var cancellable: AnyCancellable?
    
    init(taskPublisher: AnyPublisher<[Task], Never> = TaskStorage.shared.tasks.eraseToAnyPublisher()) {
        cancellable = taskPublisher.sink { tasks in
            print("Updating tasks")
            self.tasks = tasks
        }
    }
    
    func removeTask(at offsets: IndexSet) {
        TaskStorage.shared.delete(at: offsets)
    }
}
