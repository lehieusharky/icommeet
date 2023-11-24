//
//  CallControlOption.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 09/11/2023.
//

import Foundation
import SwiftUI

enum CallBottomType: Int, Identifiable {
    case microphone = 0
    case camera = 1
    case more = 2
    case exit = 3
    
    var id: Int { self.rawValue }
    
    var imageSelected: String {
        switch self {
        case .microphone:
            return "mic.fill"
        case .camera:
            return "video.fill"
        case .more:
            return "list.dash"
        case .exit:
            return "xmark"
        }
    }
    
    var imageUnSelected: String {
        switch self {
        case .microphone:
            return "mic"
        case .camera:
            return "video"
        case .more:
            return "list.dash"
        case .exit:
            return "xmark"
        }
    }
}

class CallBottomMode: ModeOnOff, ObservableObject {
    @Published var isOn: Bool
    
    var background: ThemeColorPicker {
        switch item {
        case .camera, .microphone:
            return isOn ? GlobalThemePicker.whiteColor : ThemeColorPicker(staticValue: Color.clear)
        case .exit:
            return GlobalThemePicker.redColor
        default:
            return ThemeColorPicker(staticValue: Color.clear)
        }
    }
    
    var forceground: ThemeColorPicker {
        switch item {
        case .camera, .microphone:
            return isOn ? GlobalThemePicker.blackColor : GlobalThemePicker.whiteColor
        default:
            return GlobalThemePicker.whiteColor
        }
    }
    
    var item: CallBottomType
    
    init(isOn: Bool = false, item: CallBottomType) {
        self.isOn = isOn
        self.item = item
    }
}
