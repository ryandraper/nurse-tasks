//
//  ContentView.swift
//  Nurse Tasks
//
//  Created by Ryan Draper on 2023-11-08.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    private var nurseTask: [NurseTask] = NurseTask.allNurseTask
    
    @State private var shouldShowActionSheet = false
    @State private var creatingPersonalTask = false
    @State private var creatingWorkTask = false
    @State private var navigateTo: AnyView?

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(nurseTask, id: \.assignedTo) { task in
                    NavigationLink{
                        Text("\(task.taskTitle)")
                        Text("\(task.assignedTo)")
                        Text("\(task.notes)")
                        Text("\(task.status)")
                    } label: {
                        Text("\(task.taskTitle)")
                    }
                }
//                .onDelete(perform: deleteItems)
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
              }
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        Menu{
                            NavigationLink(destination: PersonalTaskView(), isActive: $creatingPersonalTask) {
                                EmptyView()
                                Label("Add Personal Task", systemImage: "doc")
                            }
                            NavigationLink(destination: WorkTaskView(), isActive: $creatingWorkTask) {
                                EmptyView()
                                Label("Add Work Task", systemImage: "doc")
                            }
                        }
                        label: {
    //                            Image(systemName: "plus.circle.fill")
    //                            Text("Add Task")
                            Label("Add Task", systemImage: "plus.circle.fill")
                        }
                    }
                    
                }
            }
            
        } detail: {
            Text("Select an item")
        }
        
    }

//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(nurseTask[index])
//            }
//        }
//    }
}

#Preview {
//    ContentView(personalTasks: <#[Task]#>, workTasks: <#[Task]#>)
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
        .environment(\.colorScheme, .dark)
}
