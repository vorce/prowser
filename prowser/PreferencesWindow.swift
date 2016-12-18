//
//  PreferencesWindow.swift
//  prowser
//
//  Created by Joel Carlbark on 2016-12-14.
//  Copyright © 2016 Joel Carlbark. All rights reserved.
//

import Cocoa

protocol PreferencesWindowDelegate {
  func preferencesDidUpdate()
}

class PreferencesWindow: NSWindowController, NSWindowDelegate {
  var delegate: PreferencesWindowDelegate?
  
  @IBOutlet weak var sourceApp1: NSTextField!
  @IBOutlet weak var targetApp1: NSPopUpButton!
  
  @IBOutlet weak var sourceApp2: NSTextField!
  @IBOutlet weak var targetApp2: NSPopUpButton!
  
  @IBOutlet weak var sourceApp3: NSTextField!
  @IBOutlet weak var targetApp3: NSPopUpButton!
  
  @IBOutlet weak var sourceApp4: NSTextField!
  @IBOutlet weak var targetApp4: NSPopUpButton!
  
  @IBOutlet weak var catchAllApp: NSPopUpButton!
  
  
  override var windowNibName : String! {
    return "PreferencesWindow"
  }
  
  override func windowDidLoad() {
    super.windowDidLoad()
    
    self.window?.center()
    self.window?.styleMask.remove(.resizable)
    self.window?.makeKeyAndOrderFront(nil)
    NSApp.activate(ignoringOtherApps: true)
    loadPreferences(defaults: UserDefaults.standard)
  }
  
  func windowWillClose(_ notification: Notification) {
    savePreferences(defaults: UserDefaults.standard)
    delegate?.preferencesDidUpdate()
  }
  
  func loadPreferences(defaults: UserDefaults) {
    sourceApp1.stringValue = (defaults.string(forKey: "sourceApp1") ?? "")
    targetApp1.selectItem(withTitle: (defaults.string(forKey: "targetApp1") ?? ""))
    
    sourceApp2.stringValue = (defaults.string(forKey: "sourceApp2") ?? "")
    targetApp2.selectItem(withTitle: (defaults.string(forKey: "targetApp2") ?? ""))
    
    sourceApp3.stringValue = (defaults.string(forKey: "sourceApp3") ?? "")
    targetApp3.selectItem(withTitle: (defaults.string(forKey: "targetApp3") ?? ""))
    
    sourceApp4.stringValue = (defaults.string(forKey: "sourceApp4") ?? "")
    targetApp4.selectItem(withTitle: (defaults.string(forKey: "targetApp4") ?? ""))
    
    catchAllApp.selectItem(withTitle: (defaults.string(forKey: "defaultTargetApp") ?? "Safari"))
  }
  
  func savePreferences(defaults: UserDefaults) {
    defaults.setValue(sourceApp1.stringValue, forKey: "sourceApp1")
    defaults.setValue(targetApp1.titleOfSelectedItem, forKey: "targetApp1")
    
    defaults.setValue(sourceApp2.stringValue, forKey: "sourceApp2")
    defaults.setValue(targetApp2.titleOfSelectedItem, forKey: "targetApp2")
    
    defaults.setValue(sourceApp3.stringValue, forKey: "sourceApp3")
    defaults.setValue(targetApp3.titleOfSelectedItem, forKey: "targetApp3")
    
    defaults.setValue(sourceApp4.stringValue, forKey: "sourceApp4")
    defaults.setValue(targetApp4.titleOfSelectedItem, forKey: "targetApp4")
    
    defaults.setValue(catchAllApp.titleOfSelectedItem, forKey: "defaultTargetApp")
  }
}
