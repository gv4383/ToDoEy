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
                VStack {
                    ForEach(viewModel.testTasks) { task in
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
