//
//  ContentView.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/17/22.
//

import SwiftUI

struct ListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var tasks: FetchedResults<Task>
    @ObservedObject private var viewModel = ListViewModel()
//    @StateObject private var tasks = Tasks()
    
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(tasks) { task in
                        TaskView(id: task.id ?? UUID(), name: task.name ?? "Unknown", isChecked: task.isChecked)
                    }
//                    .onDelete(perform: tasks.removeTask)
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
//            .environmentObject(tasks)
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
