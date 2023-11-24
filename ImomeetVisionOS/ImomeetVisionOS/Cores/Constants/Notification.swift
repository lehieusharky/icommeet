//
//  Notification.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 14/11/2023.
//

import Foundation

extension Notification.Name {
    static var changeViewNotification: Notification.Name {
        return .init(rawValue: "kChangeViewNotification")
    }
    
    static var userLoginSuccessNotification: Notification.Name {
        return .init(rawValue: "userLoginSuccessNotification")
    }
    
    static var userLogoutSuccessNotification: Notification.Name {
        return .init(rawValue: "userLogoutSuccessNotification")
    }
}
