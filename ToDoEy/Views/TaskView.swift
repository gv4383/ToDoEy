//
//  TaskView.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/18/22.
//

import SwiftUI

struct TaskView: View {
    @StateObject private var viewModel = TaskViewModel()
    
    let id: UUID
    let name: String
    var isChecked: Bool
    
    var body: some View {
        HStack {
            ZStack {
                Image(systemName: viewModel.getCheckSymbol(isChecked: isChecked))
            }
            .onTapGesture {
                viewModel.toggleTaskCheck(
                    withId: id,
                    isChecked: isChecked
                )
            }
            
            Text(name)
                .strikethrough(isChecked)
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(id: UUID(), name: "Test task", isChecked: false)
    }
}
