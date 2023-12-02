//
//  Nurse_TasksTests.swift
//  Nurse TasksTests
//
//  Created by Ryan Draper on 2023-11-08.
//

import XCTest
@testable import Nurse_Tasks

final class Nurse_TasksTests: XCTestCase {

    func testFilterPersonalTask() {
        //Given
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD HH:mm:ss"
        let firstDate = dateFormatter.date(from: "2023-11-20 18:00") ?? Date()
        let endDate = dateFormatter.date(from: "2023-11-20 18:30") ?? Date()
        let nurseViewModel: TaskViewModel = TaskViewModel()
        let contentView: ContentView = ContentView()
        nurseViewModel.tasks.removeAll()
        let id1 = UUID().uuidString
        let id2 = UUID().uuidString
        
        nurseViewModel.addTask(id: id1, clientName:"John Doe", assignedTo:"Jane Doe", street:"ABC St", city:"Vancouver",startTime: firstDate, endTime: endDate, taskTitle: "Help Nurse Gerald with patient", notes:"Patient needs to be treated with a very calm demeanor.", reminderEnable: false, status:false, type:false)
        nurseViewModel.addTask(id: id2, clientName:"Jack Doe", assignedTo:"Phillips Doe", street:"ABC St", city:"Vancouver",startTime: firstDate, endTime: endDate, taskTitle: "Help Nurse John with patient", notes:"Patient doesn't like vegetables.", reminderEnable: false, status:false, type:true)
        
        //When
        contentView.selectedFilter = TaskFilter.Personal
        contentView.taskViewModel.tasks = nurseViewModel.tasks
        print(contentView)
        
        //Then
        let expectedResult = [
            TaskModel(id: id2, clientName:"Jack Doe", assignedTo:"Phillips Doe", street:"ABC St", city:"Vancouver",startTime: StringDate(date:firstDate), endTime: StringDate(date:endDate), taskTitle: "Help Nurse John with patient", notes:"Patient doesn't like vegetables.", reminderEnable: false, status:false, type:true)
        ]
        
        print(contentView.filteredTaskItems())
        XCTAssertEqual(contentView.filteredTaskItems(), expectedResult)
    }
    
    func testFilterWorkTask() {
        //Given
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD HH:mm:ss"
        let firstDate = dateFormatter.date(from: "2023-11-20 18:00") ?? Date()
        let endDate = dateFormatter.date(from: "2023-11-20 18:30") ?? Date()
        let nurseViewModel: TaskViewModel = TaskViewModel()
        let contentView: ContentView = ContentView()
        nurseViewModel.tasks.removeAll()
        let id1 = UUID().uuidString
        let id2 = UUID().uuidString
        
        nurseViewModel.addTask(id: id1, clientName:"John Doe", assignedTo:"Jane Doe", street:"ABC St", city:"Vancouver",startTime: firstDate, endTime: endDate, taskTitle: "Help Nurse Gerald with patient", notes:"Patient needs to be treated with a very calm demeanor.", reminderEnable: false, status:false, type:false)
        nurseViewModel.addTask(id: id2, clientName:"Jack Doe", assignedTo:"Phillips Doe", street:"ABC St", city:"Vancouver",startTime: firstDate, endTime: endDate, taskTitle: "Help Nurse John with patient", notes:"Patient doesn't like vegetables.", reminderEnable: false, status:false, type:true)
        
        //When
        contentView.selectedFilter = TaskFilter.Work
        contentView.taskViewModel.tasks = nurseViewModel.tasks
        print(contentView)
        
        //Then
        let expectedResult = [
            TaskModel(id: id1, clientName:"Jack Doe", assignedTo:"Phillips Doe", street:"ABC St", city:"Vancouver",startTime: StringDate(date:firstDate), endTime: StringDate(date:endDate), taskTitle: "Help Nurse John with patient", notes:"Patient doesn't like vegetables.", reminderEnable: false, status:false, type:false)
        ]
        
        print(contentView.filteredTaskItems())
        XCTAssertEqual(contentView.filteredTaskItems(), expectedResult)
    }
    
    func testAddTask() {
        //Given
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD HH:mm:ss"
        let firstDate = dateFormatter.date(from: "2023-11-20 18:00") ?? Date()
        let endDate = dateFormatter.date(from: "2023-11-20 18:30") ?? Date()
        let nurseViewModel: TaskViewModel = TaskViewModel()
        nurseViewModel.tasks.removeAll()
        let id1 = UUID().uuidString
        let id2 = UUID().uuidString
        
        nurseViewModel.addTask(id: id1, clientName:"John Doe", assignedTo:"Jane Doe", street:"ABC St", city:"Vancouver",startTime: firstDate, endTime: endDate, taskTitle: "Help Nurse Gerald with patient", notes:"Patient needs to be treated with a very calm demeanor.", reminderEnable: false, status:false, type:false)
        nurseViewModel.addTask(id: id2, clientName:"Jack Doe", assignedTo:"Phillips Doe", street:"ABC St", city:"Vancouver",startTime: firstDate, endTime: endDate, taskTitle: "Help Nurse John with patient", notes:"Patient doesn't like vegetables.", reminderEnable: false, status:false, type:true)
        
        //When
        var size = nurseViewModel.tasks.count
        print("Before AddTask:", size)
        nurseViewModel.addTask(id: UUID().uuidString, clientName:"Jack Doe", assignedTo:"Phillips Doe", street:"ABC St", city:"Vancouver",startTime: firstDate, endTime: endDate, taskTitle: "Help Nurse John with patient", notes:"Patient doesn't like vegetables.", reminderEnable: false, status:false, type:true)
        
        //Then
        let expectedResult = size + 1
        size = nurseViewModel.tasks.count
        print("After AddTask:", size)
        
        XCTAssertEqual(size, expectedResult)
    }
    
    func testAddPersonalTask() {
        //Given
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD HH:mm:ss"
        let firstDate = dateFormatter.date(from: "2023-11-20 18:00") ?? Date()
        let endDate = dateFormatter.date(from: "2023-11-20 18:30") ?? Date()
        let nurseViewModel: TaskViewModel = TaskViewModel()
        nurseViewModel.tasks.removeAll()
        let id = UUID().uuidString
        
        //When
        nurseViewModel.addTask(id: id, clientName:"Jack Doe", assignedTo:"Phillips Doe", street:"ABC St", city:"Vancouver",startTime: firstDate, endTime: endDate, taskTitle: "Help Nurse John with patient", notes:"Patient doesn't like vegetables.", reminderEnable: false, status:false, type:true)
        
        //Then
        let expectedResult = [
            TaskModel(id: id, clientName:"Jack Doe", assignedTo:"Phillips Doe", street:"ABC St", city:"Vancouver",startTime: StringDate(date: firstDate), endTime: StringDate(date: endDate), taskTitle: "Help Nurse John with patient", notes:"Patient doesn't like vegetables.", reminderEnable: false, status:false, type:true)
        ]
        XCTAssertEqual(nurseViewModel.tasks, expectedResult)
        
    }
    
    func testAddWorkTask() {
        //Given
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD HH:mm:ss"
        let firstDate = dateFormatter.date(from: "2023-11-20 18:00") ?? Date()
        let endDate = dateFormatter.date(from: "2023-11-20 18:30") ?? Date()
        let nurseViewModel: TaskViewModel = TaskViewModel()
        nurseViewModel.tasks.removeAll()
        let id = UUID().uuidString
    
        //When
        nurseViewModel.addTask(id: id, clientName:"John Doe", assignedTo:"Jane Doe", street:"ABC St", city:"Vancouver",startTime: firstDate, endTime: endDate, taskTitle: "Help Nurse Gerald with patient", notes:"Patient needs to be treated with a very calm demeanor.", reminderEnable: false, status:false, type:false)
        
        //Then
        let expectedResult = [
            TaskModel(id: id, clientName:"John Doe", assignedTo:"Jane Doe", street:"ABC St", city:"Vancouver",startTime: StringDate(date:firstDate), endTime: StringDate(date:endDate), taskTitle: "Help Nurse Gerald with patient", notes:"Patient needs to be treated with a very calm demeanor.", reminderEnable: false, status:false, type:false)
        ]
        XCTAssertEqual(nurseViewModel.tasks, expectedResult)
    }
    
    func testDeleteTask() {
        //Given
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD HH:mm:ss"
        let firstDate = dateFormatter.date(from: "2023-11-20 18:00") ?? Date()
        let endDate = dateFormatter.date(from: "2023-11-20 18:30") ?? Date()
        let nurseViewModel: TaskViewModel = TaskViewModel()
        nurseViewModel.tasks.removeAll()
        let id1 = UUID().uuidString
        let id2 = UUID().uuidString
        
        nurseViewModel.addTask(id: id1, clientName:"John Doe", assignedTo:"Jane Doe", street:"ABC St", city:"Vancouver",startTime: firstDate, endTime: endDate, taskTitle: "Help Nurse Gerald with patient", notes:"Patient needs to be treated with a very calm demeanor.", reminderEnable: false, status:false, type:false)
        nurseViewModel.addTask(id: id2, clientName:"Jack Doe", assignedTo:"Phillips Doe", street:"ABC St", city:"Vancouver",startTime: firstDate, endTime: endDate, taskTitle: "Help Nurse John with patient", notes:"Patient doesn't like vegetables.", reminderEnable: false, status:false, type:true)
        nurseViewModel.addTask(id: UUID().uuidString, clientName:"Jack Doe", assignedTo:"Phillips Doe", street:"ABC St", city:"Vancouver",startTime: firstDate, endTime: endDate, taskTitle: "Help Nurse John with patient", notes:"Patient doesn't like vegetables.", reminderEnable: false, status:false, type:true)
        
        //When
        var size = nurseViewModel.tasks.count
        print("Current Size: ", size)
        nurseViewModel.tasks.remove(at: size - 1)
        
        //Then
        let expectedResult = size - 1
        size = nurseViewModel.tasks.count
        print("After Delete Task:", size)
        
        XCTAssertEqual(size, expectedResult)
    }
    
}
