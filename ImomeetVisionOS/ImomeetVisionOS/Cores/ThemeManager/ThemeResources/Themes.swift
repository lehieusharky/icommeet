//
//  Themes.swift
//  ImomeetVision
//
//  Created by Thien Vu on 26/09/2023.
//

import Foundation
import SwiftUI

fileprivate let nameTheme = "name"
fileprivate let fileNameTheme = "fileName"
fileprivate let typeTheme = "type"

class Themes: NSObject, NSSecureCoding {
    public static var supportsSecureCoding: Bool = true

    private(set) var category: ThemeCategory?
    
    fileprivate var name: String?
    fileprivate var fileName: String?
    fileprivate var type: String?
    
    init(category: ThemeCategory, type: String? = nil) {
        self.category = category
        self.name = category.named
        self.fileName = category.fileName
        self.type = type
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.name, forKey: nameTheme)
        coder.encode(self.fileName, forKey: fileNameTheme)
        coder.encode(self.type, forKey: typeTheme)
    }
    
    required init?(coder: NSCoder) {
        guard let name = coder.decodeObject(of: NSString.self, forKey: nameTheme) as? String,
              let fileName = coder.decodeObject(of: NSString.self, forKey: fileNameTheme) as? String,
              let type = coder.decodeObject(of: NSString.self, forKey: typeTheme) as? String else {
            return nil
        }
        
        self.name = name
        self.fileName = fileName
        self.type = type
    }
    
    func filePath() -> String? {
        guard let fileName = fileName,
              let type = type else {
            return nil
        }
        
        return Bundle.main.path(forResource: fileName, ofType: type)
    }
    
    public func colorFromPicker(_ themePicker: ThemePicker?) -> Color {
        guard let picker = themePicker,
              let pickedVal = picker.pickedValue() as? Color else {
            return Color.clear
        }
        
        return pickedVal
    }
    
    static func == (lhs: Themes, rhs: Themes) -> Bool {
        return lhs.fileName == rhs.fileName &&
                lhs.name == rhs.name &&
                lhs.type == rhs.type
    }
}
