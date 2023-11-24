//
//  UtilConstants.swift
//  ImomeetVision
//
//  Created by Thien Vu on 30/09/2023.
//

import Foundation
import SwiftUI

class Constants {
    static let lightTheme = Themes(category: .light, type: "json")
    static let darkTheme = Themes(category: .dark, type: "json")
    
    static let screenWith = NSScreen.main!.frame.size.width
    static let screenHeight = NSScreen.main!.frame.size.height
}

//MARK: - Spacing
class Spacing : NSObject {
   /// 4
   static let spacing4: CGFloat = 4.0
   /// 8
   static let spacing8: CGFloat = 8.0
   /// 12
   static let spacing12: CGFloat = 12.0
   /// 16
   static let spacing16: CGFloat = 16.0
   /// 20
   static let spacing20: CGFloat = 20.0
   /// 24
   static let spacing24: CGFloat = 24.0
   /// 28
   static let spacing28: CGFloat = 28.0
   /// 32
   static let spacing32: CGFloat = 32.0
}

//MARK: - Notification
extension Notification.Name {
    static var changeViewNotification: Notification.Name {
        return .init(rawValue: "kChangeViewNotification")
    }
}
