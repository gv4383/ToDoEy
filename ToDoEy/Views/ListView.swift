//
//  ContentView.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/17/22.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject private var viewModel = ListViewModel()
    
    @State private var testTasks = [
        Task(name: "Test Task 1"),
        Task(name: "Test Task 2"),
        Task(name: "Test Task 3")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    ForEach(testTasks) { task in
                        HStack {
                            TaskView(name: task.name)
                            
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    AddTaskButtonView()
                        .padding()
                        .onTapGesture {
                            viewModel.isShowing = true
                        }
                }
            }
            .navigationTitle("ToDoEy")
            .background(.lightPurple)
            .sheet(isPresented: $viewModel.isShowing) {
                AddTaskView(isShowing: $viewModel.isShowing)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
