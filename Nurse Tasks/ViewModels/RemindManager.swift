//
//  RemindManager.swift
//  Nurse Tasks
//
//  Created by Wu Maggie on 2023-11-23.
//

import Foundation
import UserNotifications

class RemindManager{
    static let instance = RemindManager()
    
    func requestAuthorization(){
        let options: UNAuthorizationOptions = [.alert, .sound,.badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options){(sucess, error) in
            if let error = error{
                print("Error:\(error)")
            }else{
                print("Success")
            }
        }
    }
    
    func scheduleNotification(title:String, subtitle: String, date: Date, id: String){
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = .default
        content.badge = 1
        
        let component = Calendar.current.dateComponents([.hour, .minute], from: date)
        
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: false)
        
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelReminderWithIdentifier(identifier : String) {
        UNUserNotificationCenter.current().getPendingNotificationRequests { (notificationRequests) in
           var identifiers: [String] = []
           for notification:UNNotificationRequest in notificationRequests {
               if notification.identifier == identifier {
                  identifiers.append(notification.identifier)
               }
           }
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
        }
    }
}
