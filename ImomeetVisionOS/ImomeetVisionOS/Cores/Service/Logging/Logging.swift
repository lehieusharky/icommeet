//
//  Logging.swift
//  ImomeetVision
//
//  Created by Thien Vu on 01/10/2023.
//

import Foundation
import os

extension Logger {
  private static var subsystem = Bundle.main.bundleIdentifier!
  
  static let debug = Logger(subsystem: subsystem, category: "Debug")
}

class LogSF {
    static func LogTrace(_ log: String) {
        Logger.debug.log("[\(Date.getCurrentDateTimeToString())]:[SF_LOG] \(log)")
    }
    
    static func LogError(_ log: String) {
        Logger.debug.error("[\(Date.getCurrentDateTimeToString())]:[SF_LOG] \(log)")
    }
}
