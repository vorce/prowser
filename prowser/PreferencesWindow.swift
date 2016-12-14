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
        
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        self.window?.center()
        self.window?.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }
    
    func windowWillClose(_ notification: Notification) {
        savePreferences()
        delegate?.preferencesDidUpdate()
    }
    
    func savePreferences() {
        let defaults = UserDefaults.standard
        defaults.setValue(sourceApp1.stringValue, forKey: "sourceApp1")
        defaults.setValue(targetApp1.titleOfSelectedItem, forKey: "targetApp1")
        
        defaults.setValue(sourceApp2.stringValue, forKey: "sourceApp2")
        defaults.setValue(targetApp2.titleOfSelectedItem, forKey: "targetApp2")
        
        defaults.setValue(sourceApp3.stringValue, forKey: "sourceApp3")
        defaults.setValue(targetApp3.titleOfSelectedItem, forKey: "targetApp3")
        
        defaults.setValue(sourceApp4.stringValue, forKey: "sourceApp4")
        defaults.setValue(targetApp4.titleOfSelectedItem, forKey: "targetApp4")
        
        defaults.setValue(catchAllApp.titleOfSelectedItem, forKey: "catchAllApp")
    }
}
