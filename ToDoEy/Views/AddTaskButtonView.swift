//
//  AddTaskView.swift
//  ToDoEy
//
//  Created by Goyo Vargas on 1/17/22.
//

import SwiftUI

struct AddTaskButtonView: View {
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 64, height: 64)
                .foregroundColor(.lightBlue)
            
            Image(systemName: "plus")
                .resizable()
                .frame(width: 32, height: 32)
        }
    }
}

struct AddTaskButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskButtonView()
    }
}
