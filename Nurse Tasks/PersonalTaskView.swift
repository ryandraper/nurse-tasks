//
//  PersonalTaskView.swift
//  Nurse Tasks
//
//  Created by Benson Wang on 2023-11-17.
//

import SwiftUI

struct PersonalTaskView: View {
    @State private var title = ""
    @State private var details = ""
    @State private var selectedDate: Date = Date()
    @State private var showDates = true

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
    }
}

#Preview {
    PersonalTaskView()
}
