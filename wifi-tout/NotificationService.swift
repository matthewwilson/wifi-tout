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

    private let dateTimeFactory = DateTimeFactory()

    func emitWifiDownNotification() {
        print("emitting notification")
        let content = UNMutableNotificationContent()
        let contentBody = "Was unable to reach the internet at " + dateTimeFactory.getFormattedDate()
        content.title = "Wifi is down"
        content.body = contentBody

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
