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
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            createStatusText()
            createExitButton()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(3)
    }

    private func createStatusText() -> some View {
        Text("\(status)")
                .onReceive(timer) { _ in
                    self.onNextReachabilityTick()
                }
        .fixedSize(horizontal: true, vertical: false)
    }

    private func onNextReachabilityTick() {
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

    private func createExitButton() -> some View {
        Button(action: {
            NSApplication.shared.terminate(self)
        }) {
            Text("Quit WiFi-tout")
                    .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
