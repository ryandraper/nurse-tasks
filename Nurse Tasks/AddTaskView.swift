//
//  AddTaskView.swift
//  Nurse Tasks
//
//  Created by Wu Maggie on 2023-11-16.
//

import SwiftUI

struct AddTaskView: View {
    //@State private var task:Task = .init(clientName: "", assignedTo: "", location: Address(street: "", city: ""), startTime: Date(year: "2023", month: "12", day: "01", hour: "10", mintue: "00"), endTime: Date(year: "2023", month: "12", day: "02", hour: "10", mintue: "00"), taskTitle: "", notes: "", type: "", status: "not start")
    var body: some View {
        VStack{
            TextField("taskTitle", text: .constant(""),
            prompt: Text("Task Name"))
            
            TextField("clientName", text:.constant(""),
            prompt: Text("Client Name"))
            
            TextField("assignedTo", text:.constant(""),
            prompt: Text("Nurse Name"))
            
            TextField("location", text:.constant(""),
            prompt: Text("Client Name"))
        }
    }
}

#Preview {
    AddTaskView()
}
