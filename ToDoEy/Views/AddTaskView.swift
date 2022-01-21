//
//  AddTaskView.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/19/22.
//

import SwiftUI

struct AddTaskView: View {
    
    @Binding var isShowing: Bool
    
    @ObservedObject private var viewModel = AddTaskViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("New task")
                .font(.title).bold()
            
            TextField("Enter your new task here", text: $viewModel.userInput)
                .textFieldStyle(.roundedBorder)
            
            Button("Add task") {
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
