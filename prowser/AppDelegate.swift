//
//  AppDelegate.swift
//  prowser
//
//  Created by Joel Carlbark on 2016-12-12.
//  Copyright © 2016 Joel Carlbark. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
  
  // var previousURLHandler: CFString!
  
  func applicationDidFinishLaunching(_ aNotification: Notification) {
    NSAppleEventManager.shared().setEventHandler(self, andSelector: #selector(self.handleGetURL(event:reply:)), forEventClass: UInt32(kInternetEventClass), andEventID: UInt32(kAEGetURL) )

    // previousURLHandler = LSCopyDefaultHandlerForURLScheme("http" as CFString) as! CFString!
    LSSetDefaultHandlerForURLScheme("http" as CFString, "vorce.prowser" as CFString)
    LSSetDefaultHandlerForURLScheme("https" as CFString, "vorce.prowser" as CFString)
  }
  
  func applicationWillTerminate(_ aNotification: Notification) {
    // LSSetDefaultHandlerForURLScheme("http" as CFString, previousURLHandler)
    // LSSetDefaultHandlerForURLScheme("https" as CFString, previousURLHandler)
  }
  
  func handleGetURL(event: NSAppleEventDescriptor, reply:NSAppleEventDescriptor) {
    if let urlString = event.paramDescriptor(forKeyword: keyDirectObject)?.stringValue {
      if let sourceApp = event.attributeDescriptor(forKeyword: keyAddressAttr)?.stringValue {
        debugPrint("Got urlString: \(urlString) from \(sourceApp)")
        handleApp(app: sourceApp, url: urlString)
      }
    }
  }
  
  func handleApp(app: String, url: String) {
    if app.lowercased().hasPrefix("skype") {
      // Open url with Firefox
      openWith(app: "Firefox", url: url)
    } else {
      // Open url with Chrome
      openWith(app: "Google Chrome", url: url)
    }
  }
  
  func openWith(app: String, url: String) {
    debugPrint("Opening \(url) with app \(app)")
    let task = Process()
    task.launchPath = "/usr/bin/open"
    task.arguments = ["-a", app, url]
    task.launch()
  }
}

