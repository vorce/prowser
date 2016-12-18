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
  let urlHandler = URLHandler()
  
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
        let preferences = defaultsToPreferences(defaults: UserDefaults.standard)
        debugPrint("Got urlString: \(urlString) from \(sourceApp)")
        urlHandler.handleApp(app: sourceApp,
                             url: urlString,
                             rules: preferences.rules,
                             defaultApp: preferences.defaultApp)
      }
    }
  }
  
  func defaultsToPreferences(defaults: UserDefaults) -> Preferences {
    let rules = ["1", "2", "3", "4"].map { (index: String) -> BrowserRule in
      let sourceApp = defaults.string(forKey: "sourceApp\(index)")
      let urlPattern = defaults.string(forKey: "urlPattern\(index)")
      let targetApp = defaults.string(forKey: "targetApp\(index)")
      return BrowserRule(sourceApp: sourceApp, urlPattern: urlPattern, targetApp: targetApp)
    }
    let defaultApp = defaults.string(forKey: "defaultTargetApp") ?? "Safari"
    return Preferences(defaultApp: defaultApp, rules: rules)
  }
}

