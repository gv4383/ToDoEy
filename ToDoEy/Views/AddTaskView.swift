//
//  AddTaskView.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/19/22.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var tasks: FetchedResults<Task>
    @ObservedObject private var viewModel = AddTaskViewModel()
    
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("New task")
                .font(.title).bold()
            
            TextField("Enter your new task here", text: $viewModel.userInput)
                .textFieldStyle(.roundedBorder)
            
            Button("Add task") {
                let newTask = Task(context: moc)
                newTask.id = UUID()
                newTask.name = viewModel.userInput
                newTask.isChecked = false
                
                try? moc.save()
                
                isShowing = false
            }
            .padding()
            .foregroundColor(.black)
            .background(.lightPink)
            .cornerRadius(10)
            .padding(.vertical)
            
            Spacer()
        }
        .padding()
        .background(.lightBlue)
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(isShowing: .constant(true))
    }
}
