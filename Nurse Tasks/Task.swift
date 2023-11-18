//
//  PersonalTask.swift
//  Nurse Tasks
//
//  Created by Benson Wang on 2023-11-17.
//

import Foundation

enum taskType{
    case personal
    case work
}

struct Task {
    var title = ""
    var details = ""
    var dueDate = false
    var date = Date()
    var type: taskType?
    var assignedTo: String
}
