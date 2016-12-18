//
//  URLHandler.swift
//  prowser
//
//  Created by Joel Carlbark on 2016-12-14.
//  Copyright © 2016 Joel Carlbark. All rights reserved.
//

import Foundation

class URLHandler {
  
  func handleApp(app: String, url: String, rules: [BrowserRule], defaultApp: String) {
    var ruleMatched = false
    for rule in rules {
      if(rule.is_matching(sourceApp: app, url: url)) {
        openWith(app: rule.targetApp!, url: url)
        ruleMatched = true
        break
      }
    }

    if(!ruleMatched) {
      debugPrint("No rules matched. Opening with default app.")
      openWith(app: defaultApp, url: url)
    }
  }
  
  // TODO: There has to be a better way to do this :D
  func openWith(app: String, url: String) {
    debugPrint("Opening \(url) with app \(app)")
    let task = Process()
    task.launchPath = "/usr/bin/open"
    task.arguments = ["-a", app, url]
    task.launch()
  }
}
