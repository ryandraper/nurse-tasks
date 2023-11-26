//
//  Nurse_TasksApp.swift
//  Nurse Tasks
//
//  Created by Ryan Draper on 2023-11-08.
//

import SwiftUI
import SwiftData

@main
struct Nurse_TasksApp: App {
    
    @StateObject var taskViewModel:TaskViewModel = TaskViewModel()
    
    init(){
        RemindManager.instance.requestAuthorization()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(taskViewModel)
        }
    }
}
