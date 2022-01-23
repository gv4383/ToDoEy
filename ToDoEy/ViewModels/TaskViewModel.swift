//
//  TaskViewModel.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/23/22.
//

import Foundation

final class TaskViewModel: ObservableObject {
    
    @Published var isChecked = false
    
    var checkSymbol: String {
        isChecked
            ? "checkmark.circle"
            : "circle"
    }
}
