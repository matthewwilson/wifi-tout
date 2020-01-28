//
//  NotificationService.swift
//  wifi-tout
//
//  Created by Matthew Wilson on 28/01/2020.
//  Copyright © 2020 Matthew Wilson. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationService {
    
    func emitWifiDownNotification() {
        print("emitting notification")
        let content = UNMutableNotificationContent()
        content.title = "Wifi is down"
        content.body = "Was unable to reach google.com"

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)

        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
           if error != nil {
            print("\(error!.localizedDescription)")
           }
        }
    }
    
}
