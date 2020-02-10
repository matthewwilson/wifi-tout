//
// Created by Kelvin Harron on 09/02/2020.
// Copyright (c) 2020 Matthew Wilson. All rights reserved.
//

import Foundation
import os

class EventLogger {

    func logWifiTouting() {
        os_log("Was unable to reach the internet", log: OSLog.app, type: .error)
    }

    func logAppStartup() {
        os_log("Wifi tout started", log: OSLog.app, type: .error)
    }

    func logAppTerminated() {
        os_log("Wifi tout stopped", log: OSLog.app, type: .error)
    }

    private func getIdentifier() -> String {
        if let bundleIdentifier = Bundle.main.bundleIdentifier {
            return bundleIdentifier
        } else {
            return "so.mwil.wifi-tout"
        }
    }
}

extension OSLog {
    static let app = OSLog(category: "Application")
    static let event = OSLog(category: "Event")

    private convenience init(category: String, bundle: Bundle = Bundle.main) {
        let identifier = bundle.infoDictionary?["CFBundleIdentifier"] as? String ?? "so.mwil.wifi-tout"
        self.init(subsystem: (identifier).appending(".logs"), category: category)
    }
}
