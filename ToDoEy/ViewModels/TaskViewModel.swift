//
//  TaskViewModel.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/23/22.
//

import Foundation

final class TaskViewModel: ObservableObject {
    
    func getCheckSymbol(isChecked: Bool) -> String {
        return isChecked
            ? "checkmark.circle"
            : "circle"
    }
}
