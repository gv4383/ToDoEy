//
//  ContentView.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/17/22.
//

import SwiftUI

struct ListView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    AddTaskButtonView()
                        .padding()
                }
            }
            .navigationTitle("ToDoEy")
            .background(.lightPurple)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
