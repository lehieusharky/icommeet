//
//  VCIMobile
//
//  Created by Thien Vu on 20/08/2022.
//

import Foundation

public protocol ThemePicker {
    func pickedValue() -> Any?
    func needUpdateWhenThemeChange() -> Bool
    func needAnimatedUpdate() -> Bool
    func staticValue() -> Any?
}

public class BaseThemePicker: ThemePicker, Equatable {
    private(set) var keyPath : String?
    public var needUpdate : Bool = true
    public var animatedUpdate : Bool = true
    
    public var _staticValue:Any?
    
    init(keyPath: String) {
        self.keyPath = keyPath
    }
    
    init(staticValue value:Any?) {
        _staticValue = value
        needUpdate = false
    }
    
    init(_ picker:BaseThemePicker) {
        self.keyPath = picker.keyPath
    }
    
    open func pickedValue() -> Any? {
        // Subclass should override
        return nil
    }
    
    public func staticValue() -> Any? {
        return _staticValue
    }
    
    public func needUpdateWhenThemeChange() -> Bool {
        return _staticValue == nil && needUpdate
    }
    
    public func needAnimatedUpdate() -> Bool {
        return animatedUpdate
    }
    
    public static func == (lhs: BaseThemePicker, rhs: BaseThemePicker) -> Bool {
        return lhs.keyPath == rhs.keyPath
    }

}
