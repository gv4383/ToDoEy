//
//  ContentView.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/17/22.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject private var viewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.testTasks) { task in
                        TaskView(name: task.name)
                    }
                    .onDelete(perform: viewModel.removeTask)
                }
                .onAppear {
                    UITableView.appearance().backgroundColor = UIColor.clear
                    UITableViewCell.appearance().backgroundColor = UIColor.clear
                }
                
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
                AddTaskView(isShowing: $viewModel.isShowing, tasks: $viewModel.testTasks)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
