//
//  AppDelegate.swift
//  wifi-tout
//
//  Created by Matthew Wilson on 28/01/2020.
//  Copyright © 2020 Matthew Wilson. All rights reserved.
//

import Cocoa
import SwiftUI
import UserNotifications

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!
    var popover: NSPopover!
    var statusBarItem: NSStatusItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            // Enable or disable features based on authorization.
            print("Got permission to emit notifications \(granted)")
        }
        showUI()
    }
    
    func showUI() {
        let contentView = ContentView()
        
        let popover = NSPopover()
        popover.contentSize = NSSize(width: 100, height: 50)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: contentView)
        self.popover = popover
        
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        if let button = self.statusBarItem.button {
             button.image = NSImage(named: "Icon")
             button.action = #selector(togglePopover(_:))
             self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc func togglePopover(_ sender: AnyObject?) {
         if let button = self.statusBarItem.button {
              if self.popover.isShown {
                   self.popover.performClose(sender)
              } else {
                   self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
              }
         }
    }
}

