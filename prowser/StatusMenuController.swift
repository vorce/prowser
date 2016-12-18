//
//  StatusMenuController.swift
//  prowser
//
//  Created by Joel Carlbark on 2016-06-17.
//  Copyright © 2016 Joel Carlbark. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
  @IBOutlet weak var statusMenu: NSMenu!
  @IBOutlet weak var preferencesClicked: NSMenuItem!
  // var preferences = Preferences(defaultApp: "Safari", rules: [])
  
  let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
  var preferencesWindow: PreferencesWindow!
  
  override func awakeFromNib() {
    let icon = NSImage(named: "IconSet")
    icon?.isTemplate = true
    
    statusItem.image = icon
    statusItem.menu = statusMenu
    
    preferencesWindow = PreferencesWindow()
  }
  
  @IBAction func quitClicked(_ sender: NSMenuItem) {
    debugPrint("Quitting, bye...")
    NSApplication.shared().terminate(self)
  }

  @IBAction func preferencesClicked(_ sender: NSMenuItem) {
    debugPrint("Showing Preferences window")
    preferencesWindow.showWindow(nil)
  }  
}
