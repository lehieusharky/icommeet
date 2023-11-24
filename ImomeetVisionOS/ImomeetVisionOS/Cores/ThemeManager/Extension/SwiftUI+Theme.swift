//
//  VCIMobile
//
//  Created by Thien Vu on 18/08/2022.
//

import Foundation
import SwiftUI

fileprivate let themeManager = ThemeManager.sharedInstance.getCurrentTheme()

extension View {
    public func themeBackgroudColor(_ picker: ThemePicker?) -> some View {
        self.background(themeManager.colorFromPicker(picker))
    }
    
    public func themeForegroundColor(_ picker: ThemePicker?) -> some View {
        self.foregroundStyle(themeManager.colorFromPicker(picker))
    }
    
    public func bordered(_ picker: ThemePicker?, width: CGFloat) -> some View {
        self.border(themeManager.colorFromPicker(picker), width: width)
    }
}

extension Shape {
    public func filled(_ picker: ThemePicker?) -> some View {
        self.fill(themeManager.colorFromPicker(picker))
    }
    
    public func stroke(_ picker: ThemePicker?, width: CGFloat) -> some View {
        self.stroke(themeManager.colorFromPicker(picker), lineWidth: width)
    }
}


extension Text {
    public func themeTextColor(_ picker: ThemePicker?) -> some View {
        self.foregroundStyle(themeManager.colorFromPicker(picker))
    }
}

extension Label {
    @available(macOS 14.0, *)
    public func themeTextColor(_ picker: ThemePicker?) -> some View {
        self.foregroundStyle(themeManager.colorFromPicker(picker))
    }
}

extension Image {
    @available(macOS 14.0, *)
    public func themeTintColor(_ picker: ThemePicker?) -> some View {
        self.foregroundStyle(themeManager.colorFromPicker(picker))
    }
}
