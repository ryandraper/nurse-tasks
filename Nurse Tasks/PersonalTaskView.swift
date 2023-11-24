//
//  PersonalTaskView.swift
//  Nurse Tasks
//
//  Created by Benson Wang on 2023-11-17.
//

import SwiftUI
import Foundation

struct PersonalTaskView: View {
    @State private var title = ""
    @State private var details = ""
    @State private var selectedDate: Date = Date()
    @State private var showDates = true
    
    private var taskDict : [String: Any] = ["clientName":"client10",
                                            "assignedTo":"nurse21", "location": {["street":"123 Ave", "city": "Atlantis"]}, "startTime":{["year":"2023","month":"11","day":"11", "hour":"23","minute":"11"]}, "endTime":{["year":"2023","month":"11","day":"13", "hour":"23","minute":"11"]}, "taskTitle":"task11", "notes":"There needs to be stuff done.", "type":"personal", "status":"ongoing", "reminderEnabled":true]
    

//    @State var contentView = ContentView(personalTasks: <#T##[Task]#>, workTasks: <#T##[Task]#>);
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Title", text: $title)
                        TextField("Details", text: $details, axis: .vertical)
                            .lineLimit(10, reservesSpace: true)
                 
                    }
                    Section {
                        Toggle("Reminder", isOn: $showDates)
                        if showDates {
                            DatePicker("Select Date", selection: $selectedDate)
                                .padding(.horizontal)
                        }
                    }
                }
                
            }
            .navigationTitle("Personal Task Details")
        }
        .toolbar() {
            ToolbarItem(placement: .navigationBarTrailing) {
                VStack{
                    Button("Add", action: addTask)
                }
            }
        }
    }
    
    private func addTask () {
        //print(taskDict)
        var array:[NurseTask] = {
            do {
                let fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                    .appendingPathComponent("nurseTask.json")
                
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                let tasks = try decoder.decode([NurseTask].self, from: data)
                return tasks
                
            }
            catch {
                print(error.localizedDescription)
                return []
            }
        }()
        
        print(array)
    }
}

#Preview {
    PersonalTaskView()
}
