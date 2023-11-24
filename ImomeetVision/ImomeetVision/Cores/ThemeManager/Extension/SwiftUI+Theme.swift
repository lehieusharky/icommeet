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
