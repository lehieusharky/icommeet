//
//  VCIMobile
//
//  Created by Thien Vu on 18/08/2022.
//

import Foundation
import SwiftUI

public final class ThemeColorPicker: BaseThemePicker {
    public weak var target : AnyObject?
    public var tag : Int = 0
    public var alpha : NSNumber?
    
    override public init(keyPath: String) {
        super.init(keyPath: keyPath)
    }
    
    public init(stringLiteral value: StringLiteralType) {
        super.init(keyPath: value)
    }
    
    public override init(staticValue value: Any?) {
        super.init(staticValue: value)
    }
    
    public override func pickedValue() -> Any? {
        if let value = staticValue() {
            return value
        }
        
        guard let keyPath = keyPath,
              let color = ThemeManager.sharedInstance.themeResource?.color(forKeyPath: keyPath)
        else {
            return Color.clear
        }
        
        return color
    }
}

extension ThemeColorPicker : ExpressibleByStringLiteral {}
