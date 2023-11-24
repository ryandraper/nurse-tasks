//
//  TaskViewModel.swift
//  Nurse Tasks
//
//  Created by Wu Maggie on 2023-11-23.
//

import Foundation

class TaskViewModel: ObservableObject{
    @Published var tasks:[TaskModel] = []{
        didSet{
            saveTasks()
        }
    }
    
    let taskKey: String = "data.json"
    
    init(){
        getTasks()
    }
    
    func getTasks(){
        /*
        let existingTasks:[TaskModel] = TaskModel.allTasks
        tasks.append(contentsOf: existingTasks)*/
        guard let data = UserDefaults.standard.data(forKey: taskKey),
              let savedTasks = try? JSONDecoder().decode([TaskModel].self, from: data)
        else{
            return
        }
        self.tasks = savedTasks
        
    }
    
    func deleteTask(at offsets: IndexSet){
        tasks.remove(atOffsets: offsets)
    }
    
    func addTask(id: String, clientName: String, assignedTo: String, street:String,city:String, startTime: Date, endTime: Date, taskTile: String, notes: String, reminderEnable: Bool, status: Bool, type: Bool){
        let sT = StringDate(date: startTime)
        let eT = StringDate(date: endTime)
        let newTask = TaskModel(id: id, clientName: clientName, assignedTo: assignedTo, street: street, city: city, startTime: sT, endTime: eT, taskTile: taskTile, notes: notes, reminderEnable: reminderEnable, status: status, type: type)
        if(reminderEnable){
            //RemindManager.instance.scheduleNotification(title: "first", subtitle: "test")
        }
        tasks.append(newTask)
    }
    
    func updateTask(task: TaskModel){
        if let index =  tasks.firstIndex(where: {$0.id == task.id}){
            tasks[index] = task.updateCompleted()
        }
    }
    
    func saveTasks(){
        if let encodeData = try? JSONEncoder().encode(tasks){
            UserDefaults.standard.set(encodeData, forKey: taskKey)
        }
    }
    
}
