//
//  ThemeManager.swift
//  ImomeetVision
//
//  Created by Thien Vu on 26/09/2023.
//

import Foundation
import SwiftUI

fileprivate let kCurrentAppTheme = "currentAppTheme"

protocol Themable {
    mutating func themDidChange()
}

protocol ThemeManagerObserver {
    func addThemeObserver(_ observer: Themable)
    func removeThemeObserver(_ observer: Themable)
}

class ThemeManager {
    
    static let sharedInstance = ThemeManager()
    
    private var currentTheme: Themes = Constants.lightTheme {
        didSet {
            reloadThemeResource()
            saveCurrentTheme()
        }
    }
    
    private(set) var themeResource: ThemeResource?
    private(set) var availableTheme: [Themes] = []
    
    private var observers: [AnyHashable: Any]
    private var locker = NSLock()
    
    private init() {
        observers = [AnyHashable: Any]()
        
        availableTheme = [Constants.lightTheme, Constants.darkTheme]
        
        getSaveCurrentTheme()
    }
    
    func getCurrentTheme() -> Themes {
        return currentTheme
    }
    
    func currentThemeIndex() -> Int {
        return availableTheme.firstIndex(where: {$0 == currentTheme}) ?? 0
    }
    
    func setTheme(_ theme: ThemeCategory) {
        guard let theme = availableTheme.first(where: {$0.category == theme}) else {
            LogSF.LogError("No have themes in list")
            return
        }
        currentTheme = theme
    }
    
    func reloadThemeResource() {
        loadResourceForCurrentTheme()
        applyTheme()
    }
    
    func updateThemeWithResourceString(_ string: String) -> Bool {
        if let successed = themeResource?.updateWithResource(string),
           successed {
            applyTheme()
            return true
        }
        
        return false
    }
    
    func saveCurrentTheme() {
        if let archive = try? NSKeyedArchiver.archivedData(withRootObject: currentTheme, requiringSecureCoding: true) {
            UserDefaults.standard.setValue(archive, forKey: kCurrentAppTheme)
            UserDefaults.standard.synchronize()
        }
    }
    
    func applyTheme() {
        for object in observers.values {
            if let weakReference = object as? WeakReferenceObserver<Themable>,
               var observer = weakReference.value {
                observer.themDidChange()
            }
        }
    }
    
    func getSaveCurrentTheme() {
        if let themeData = UserDefaults.standard.object(forKey: kCurrentAppTheme) as? Data,
              let savedTheme = try? NSKeyedUnarchiver.unarchivedObject(ofClass: Themes.self, from: themeData) {
            currentTheme = savedTheme
        }
        
        reloadThemeResource()
    }
    
    func isDarkTheme() -> Bool {
        return themeResource?.category == ThemeCategory.dark
    }
    
    func loadResourceForCurrentTheme() {
        if let filePath = currentTheme.filePath() {
            themeResource = try? ThemeResource(path: filePath)
        }
    }
    
    func colorFromPicker(_ themePicker: ThemePicker) -> Color {
        return currentTheme.colorFromPicker(themePicker)
    }
}

extension ThemeManager: ThemeManagerObserver {
    func addThemeObserver(_ observer: Themable) {
        locker.lock()
        if !self.observers.keys.contains(ObjectIdentifier(type(of: observer))) {
            let weakObserver = WeakReferenceObserver(value: observer)
            self.observers[ObjectIdentifier(type(of: observer))] = weakObserver
        }
        locker.unlock()
    }
    
    func removeThemeObserver(_ observer: Themable) {
        locker.lock()
        if self.observers.keys.contains(ObjectIdentifier(type(of: observer))) {
            self.observers.removeValue(forKey: ObjectIdentifier(type(of: observer)))
        }
        locker.unlock()
    }
}
