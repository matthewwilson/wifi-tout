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
    private let eventLogger = EventLogger()

    func emitWifiDownNotification() {
        print("Emitting wifi interrupted notification")
        eventLogger.logWifiTouting()

        let notificationContent = buildNotificationContent()
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trigger)

        dispatchNotification(with: request)
    }

    private func buildNotificationContent() -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = "WiFi interrupted"
        content.body = "Was unable to reach the internet at " + dateTimeFactory.getFormattedTime()
        return content
    }

    private func dispatchNotification(with request: UNNotificationRequest) {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if error != nil {
                print("\(error!.localizedDescription)")
            }
        }
    }
}
