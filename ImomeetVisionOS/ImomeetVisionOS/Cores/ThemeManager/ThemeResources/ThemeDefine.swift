//
//  ThemeDefine.swift
//  ImomeetVision
//
//  Created by Thien Vu on 26/09/2023.
//

import Foundation

enum ThemeCategory: Int {
    case light = 0
    case dark  = 1
    
    public var named: String {
        switch self {
        case .light:
            return "light"
        case .dark:
            return "dark"
        }
    }
    
    public var fileName: String {
        switch self {
        case .light:
            return "light_theme"
        case .dark:
            return "dark_theme"
        }
    }
}
