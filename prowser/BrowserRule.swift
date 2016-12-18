//
//  BrowserRule.swift
//  prowser
//
//  Created by Joel Carlbark on 2016-12-14.
//  Copyright © 2016 Joel Carlbark. All rights reserved.
//

import Foundation

class BrowserRule {
  var sourceApp: String?
  var urlPattern: String?
  var targetApp: String?
  
  init(sourceApp: String?, urlPattern: String?, targetApp: String?) {
    self.sourceApp = sourceApp
    self.urlPattern = urlPattern
    self.targetApp = targetApp
  }
  
  func is_matching(sourceApp: String, url: String) -> Bool {
    if((self.targetApp ?? "").isEmpty) {
      return false
    }
    
    let sourceMatch = (self.sourceApp ?? "").isEmpty ? false
                      : sourceApp
                        .lowercased()
                        .contains(self.sourceApp!.lowercased())
    let urlMatch = (self.urlPattern ?? "").isEmpty ? true
                    : url.range(of: self.urlPattern!, options: .regularExpression) != nil
    
    return sourceMatch && urlMatch
  }
}
