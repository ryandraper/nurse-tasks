// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let personalTask = try? JSONDecoder().decode(PersonalTask.self, from: jsonData)

import Foundation

struct NurseTask: Codable {
    let clientName, assignedTo: String
    let location: Location
    let startTime, endTime: Datetime
    let taskTitle, notes, type, status: String
    let reminderEnabled: Bool
    
    static let allNurseTask: [NurseTask] = Bundle.main.decode(file: "nurseTask.json")
    
    static let sampleNurseTask: NurseTask = allNurseTask[0]
}

struct Datetime: Codable {
    let year, month, day, hour: String
    let mintue: String
}

struct Location: Codable {
    let street, city: String
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the project!")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not find \(file) in the project!")
        }
        let decoder = JSONDecoder()
                
        guard let loadedData = try? decoder.decode(T.self, from: data)else{
            fatalError("Could not decode \(file) in the project!")
        }
                
        return loadedData
    }
}
