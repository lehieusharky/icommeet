//
//  LanguageManager.swift
//  ImomeetVision
//
//  Created by Thien Vu on 18/09/2023.
//

import Foundation

class LanguageManager : ObservableObject{
    static let kLanguageSetting: String = "kLanguageSetting"

    static let shared = LanguageManager()
    
    @Published public var language: SFLanguage = .vietnamese{
        didSet {
            UserDefaults.standard.set(language.rawValue, forKey: Self.kLanguageSetting)
        }
    }

    init() {
        if let languageSetting = UserDefaults.standard.value(forKey: Self.kLanguageSetting) as? Int,
           let vciLanguage = SFLanguage(rawValue: languageSetting) {
            language = vciLanguage
        } else {
//            let langStr: String?
            
//            if #available(iOS 16, *) {
//                langStr = Locale.current.language.languageCode?.identifier
//            } else {
//                langStr = Locale.current.languageCode
//            }
            language = .english
        }
    }
}

extension Bundle {
    static func languageBundle(language: SFLanguage) -> Bundle? {
        let localeString = language.localeString
        guard let path = Bundle.main.path(forResource: localeString, ofType: "lproj") else {
            return nil
        }
        return Bundle(path: path)
    }
}

@objc public enum SFLanguage : Int, CaseIterable, Identifiable {
    public var id: Self {self}
    
    case english = 0
    case vietnamese = 1
    case chinaSimple = 2
    case chinaTraditional = 3
    case thailan = 4
    case arabic = 5
    case german = 6
    case french = 7
    case indo = 8
    case italian = 9
    case japanese = 10
    case korean = 11
    case polish = 12
    case portugal = 13
    case russian = 14
    case spanish = 15
    
    var localeString: String {
        switch self {
        case .english:
            return "en"
        case .vietnamese:
            return "vi"
        case .chinaSimple:
            return "zh-Hans"
        case .chinaTraditional:
            return "zh-Hant"
        case .japanese:
            return "ja"
        case .korean:
            return "ko"
        default:
            return "en"
        }
    }
    
    func localizedString() -> String {
        switch self {
        case .english:
            return "English"
        case .vietnamese:
            return "Vietnamese"
        case .chinaSimple:
            return "Chinese (Simplified)"
        case .chinaTraditional:
            return "Chinese (Traditional)"
        case .thailan:
            return "Thai"
        case .arabic:
            return "Arabic"
        case .german:
            return "German"
        case .french:
            return "French"
        case .indo:
            return "Indonesian"
        case .italian:
            return "Italian"
        case .japanese:
            return "Japanese"
        case .korean:
            return "Korean"
        case .polish:
            return "Polish"
        case .portugal:
            return "Portuguese"
        case .russian:
            return "Russian"
        case .spanish:
            return "Spanish"
        }
    }
}

extension String {
    public func localizedLanguage() -> String {
        guard let bundle = Bundle.languageBundle(language: LanguageManager.shared.language) else {
            assertionFailure("Requesting unavailable language")
            return localizedWith(bundle: Bundle.main)
        }
        
        return localizedWith(bundle: bundle)
    }
    
    private func localizedWith(bundle: Bundle) -> String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: bundle,
            comment: ""
        )
    }
}
