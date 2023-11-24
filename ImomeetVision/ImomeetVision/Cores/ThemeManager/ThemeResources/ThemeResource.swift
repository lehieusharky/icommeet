//
//  ThemeResource.swift
//  ImomeetVision
//
//  Created by Thien Vu on 26/09/2023.
//

import Foundation
import SwiftUI

protocol ThemeKeyPath {
    func string(forKeyPath keyPath: String) -> String?
    func color(forKeyPath keyPath: String) -> Color?
}

class ThemeResource {
    private var resource: [String: Any]?
    private var stringContent: String?
    
    private var colorPalette: [String: Color]?
    public var category: ThemeCategory?
    
    init(resource: Dictionary<String, Any>, stringContent: String, colorPalette: Dictionary<String, Color>, category: ThemeCategory) {
        self.resource = resource
        self.stringContent = stringContent
        self.colorPalette = colorPalette
        self.category = category
    }
    
    init(path: String) throws {
        let url = URL(filePath: path)
        let data = try Data(contentsOf: url)
        if let string = String(data: data, encoding: .utf8) {
            self.stringContent = string
        }
        if !self.parseValueFrom(data: data) {
            throw XpertError.exeption()
        }
    }
    
    public func updateWithResource(_ string: String) -> Bool {
        guard let data = string.data(using: .utf8) else {
            return false
        }
        
        return self.parseValueFrom(data: data)
    }
    
    private func parseValueFrom(data: Data) -> Bool {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] else {
            return false
        }
        
        if let color = json["colorPalette"] as? [String: Any] {
            self.loadColorPaletteWith(dict: color)
        }
        
        if let keyMap = json["key-map"] as? [String: Any] {
            loadColorKeyWith(dict: keyMap)
        }
        
        if let categoryRaw = json["category"] as? Int {
            self.category = ThemeCategory(rawValue: categoryRaw)
        }
        
        return true
    }
    
    private func loadColorPaletteWith(dict: [String: Any]) {
        var final: [String: Color] = [:]
        
        for (key, value) in dict {
            if let value = value as? String {
                final[key] = Color.colorFromHex(value)
            }
        }
        
        self.colorPalette = final
    }
    
    private func loadColorKeyWith(dict: [String: Any]) {
        var final: [String: String] = [:]
        
        for (key, value) in dict {
            guard let value = value as? [String: String] else {
                return
            }
            
            for (keyss, valuess) in value {
                final[key + "." + keyss] = valuess
            }
        }
        
        self.resource = final
    }
}

extension ThemeResource: ThemeKeyPath {
    func string(forKeyPath keyPath: String) -> String? {
        if let resource = resource,
           let val = resource[keyPath] as? String {
            return val
        }
        
        return nil
    }
    
    func color(forKeyPath keyPath: String) -> Color? {
        if let resource = string(forKeyPath: keyPath),
           let val = ThemeResource.color(fromString: resource, inResource: self) {
            return val
        }
        
        return nil
    }
    
    static func color(fromString string: String, inResource resource: ThemeResource?) -> Color? {
        guard let resource = resource else {
            return nil
        }
        
        if string.hasPrefix("@") {
            guard let colorPalate = resource.colorPalette,
                  string.count >= 2 else {
                return Color.clear
            }
            
            if let colorName = string.components(separatedBy: "@").last,
               let value = colorPalate[colorName] {
                return value
            }
        }
        
        return Color.colorFromHex(string)
    }
    
    func image(forKeyPath keyPath: String) -> Image? {
        if let imageName = string(forKeyPath: keyPath) {
            return Image(imageName)
        }
        
        return nil
    }
}
