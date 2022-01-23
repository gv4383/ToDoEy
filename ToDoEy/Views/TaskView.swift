//
//  TaskView.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/18/22.
//

import SwiftUI

struct TaskView: View {
    
    @ObservedObject private var viewModel = TaskViewModel()
    
    let name: String
    
    var body: some View {
        HStack {
            ZStack {
                Image(systemName: viewModel.checkSymbol)
            }
            .onTapGesture {
                viewModel.isChecked = !viewModel.isChecked
            }
            
            Text(name)
                .strikethrough(viewModel.isChecked)
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(name: "Test task")
    }
}
