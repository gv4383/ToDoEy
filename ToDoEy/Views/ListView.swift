//
//  ContentView.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/17/22.
//

import SwiftUI

struct ListView: View {
    @StateObject private var viewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.tasks) { task in
                        TaskView(
                            id: task.id ?? UUID(),
                            name: task.name ?? "Unknown",
                            isChecked: task.isChecked
                        )
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
                AddTaskView(isShowing: $viewModel.isShowing)
            }
            .preferredColorScheme(.light)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
