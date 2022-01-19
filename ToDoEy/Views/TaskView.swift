//
//  TaskView.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/18/22.
//

import SwiftUI

struct TaskView: View {
    
    let name: String
    
    var body: some View {
        Text(name)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(name: "Test task")
    }
}
