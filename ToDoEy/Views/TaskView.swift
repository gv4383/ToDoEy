//
//  TaskView.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/18/22.
//

import SwiftUI

struct TaskView: View {
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: []) var tasks: FetchedResults<Task>
    @StateObject private var viewModel = TaskViewModel()
    
    let id: UUID
    let name: String
    var isChecked: Bool
    
//    var selectedTaskIndex: Int {
//        tasks.firstIndex { task in
//            task.id == id
//        }!
//    }
    
    var body: some View {
        HStack {
            ZStack {
                Image(systemName: viewModel.getCheckSymbol(isChecked: isChecked))
            }
//            .onTapGesture {
//                tasks.items[selectedTaskIndex].isChecked = !isChecked
//            }
            
            Text(name)
//                .strikethrough(isChecked)
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(id: UUID(), name: "Test task", isChecked: false)
    }
}
