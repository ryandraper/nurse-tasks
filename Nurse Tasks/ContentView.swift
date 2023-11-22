//
//  ContentView.swift
//  Nurse Tasks
//
//  Created by Ryan Draper on 2023-11-08.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    private var task:[Task] = Task.allTasks
    var body: some View {
        NavigationView{
            List{
                ForEach(task, id:\.taskTitle){task in NavigationLink(destination: DetailTaskView(task: task)){
                    VStack(alignment: .leading, content: {
                        Text("\(task.taskTitle)").bold()
                        Text("\(task.assignedTo)").foregroundStyle(.gray)
                    })
                }.padding(6)
                }.navigationTitle("Tasks")
                    .toolbar{
                        ToolbarItem(placement:.navigationBarTrailing){
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                NavigationLink(destination: AddTaskView()){
                                    Text("Add")
                                }
                            })
                        }
                        
                    }
            }
        }
    }
}
struct ContentView_Previews:
    PreviewProvider{
    static var previews: some View{
        ContentView()
    }
    
}
      
