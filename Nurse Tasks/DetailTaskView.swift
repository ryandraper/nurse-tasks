//
//  DetailTaskView.swift
//  Nurse Tasks
//
//  Created by Wu Maggie on 2023-11-16.
//

import SwiftUI

struct DetailTaskView: View {
    var task:Task
    var body: some View {
        VStack(spacing: 10){
            Text("\(task.taskTitle)").bold()
            Text("\(task.assignedTo)").bold()
            Text("\(task.location.city), \(task.location.street)")
            Text("\(task.type)")
            Text("\(task.status)")
            Text("from \(task.startTime.month)/\(task.startTime.day)/\(task.startTime.year) \(task.startTime.hour):\(task.startTime.mintue)")
            Text("to \(task.endTime.month)/\(task.endTime.day)/\(task.endTime.year) \(task.endTime.hour):\(task.endTime.mintue)")
            Text("\(task.notes)")
        }
    }
}

struct DetailTaskView_Previews:PreviewProvider{
    static var previews: some View{
        DetailTaskView(task: Task.sampleTask)
    }
}
