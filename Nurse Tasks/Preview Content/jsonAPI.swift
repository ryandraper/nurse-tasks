//
//  jsonAPI.swift
//  Nurse Tasks
//
//  Created by Wu Maggie on 2023-11-16.
//

import Foundation
public struct Task:Codable{
    var clientName: String
    var assignedTo : String
    var location: Address
    var startTime, endTime: Date
    var taskTitle, notes, type: String
    var status: String  //whether the task is completed
    
    init(clientName: String, assignedTo: String, location: Address, startTime: Date, endTime: Date, taskTitle: String, notes: String, type: String, status: String) {
        self.clientName = clientName
        self.assignedTo = assignedTo
        self.location = location
        self.startTime = startTime
        self.endTime = endTime
        self.taskTitle = taskTitle
        self.notes = notes
        self.type = type
        self.status = status
    }
    
    static let allTasks:[Task] = Bundle.main.decode(file: "data.json")
    //static let allLocations:[Address] = Bundle.main.decode(file: <#T##String#>)
    static let sampleTask : Task = allTasks[0]
}

public struct Address:Codable{
    var street, city: String
}

public struct Date:Codable{
    var year, month, day, hour, mintue: String
}

extension Bundle{
    func decode<T:Decodable> (file:String)->T{
        guard let url = self.url(forResource: file, withExtension:nil) else{
            fatalError("Could not find \(file) in the project!")
        }
        
        guard let data = try? Data(contentsOf: url)else{
            fatalError("Could not load \(file) in the project!")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data)else{
            fatalError("Could not decode \(file) in the project!")
        }
        
        return loadedData
    }
}
