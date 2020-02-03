//
//  ContentView.swift
//  wifi-tout
//
//  Created by Matthew Wilson on 28/01/2020.
//  Copyright © 2020 Matthew Wilson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var connectionFailureDetected = false
    @State private var status = "Connected to WiFi"
    private let reachability = Reachability()
    private let notificationService = NotificationService()
    private let timer = Timer.publish(every: 20, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("\(status)")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onReceive(timer) { _ in
                print("Tick")
                if (self.reachability.isConnectedToNetwork()) {
                    self.status = "Connected to WiFi"
                    self.connectionFailureDetected = false
                } else {
                    self.status = "Not connected to WiFi"
                    if !self.connectionFailureDetected {
                        self.notificationService.emitWifiDownNotification()
                        self.connectionFailureDetected = true
                    }
                }
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
