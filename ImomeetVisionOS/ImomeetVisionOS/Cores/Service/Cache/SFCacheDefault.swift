//
//  SFUserdefault.swift
//  ImomeetVision
//
//  Created by Thien Vu on 04/10/2023.
//

import Foundation

class SFCacheDefault {
    
    static let shared = SFCacheDefault()
    
    private let cache = CacheManagers<String, String>()
    
    fileprivate let kAccessTokenKey = "kAccessTokenSFVision"
    
    private init() {}
}

extension SFCacheDefault: UserDefaultProtocol {
    func setRuntimeValue(_ value: Any?, forKey _key: String) {
        UserDefaults.standard.setValue(value, forKey: _key)
    }
    
    func setValue(_ value: Any?, forKey _key: String) {
        UserDefaults.standard.setValue(value, forKey: _key)
        UserDefaults.standard.synchronize()
    }
    
    func getValuefor(key: String) -> Any? {
        let value = UserDefaults.standard.value(forKey: key)
        return value
    }
    
    func setValue(_ value: Any?, forKeyPath _key: String) {
        UserDefaults.standard.setValue(value, forKeyPath: _key)
        UserDefaults.standard.synchronize()
    }
    
    func getValuefor(keyPath: String) -> Any? {
        let value = UserDefaults.standard.value(forKeyPath: keyPath)
        return value
    }
    
    func removeValueFor(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func setObject<Object>(object: Object, forKey key: String) where Object: NSCoding {
        if let encodedData = try? NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false) {
            UserDefaults.standard.set(encodedData, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
    
    func getObjectFor<Object>(key: String) -> Object? where Object : NSObject, Object : NSCoding {
        if let savedData = UserDefaults.standard.data(forKey: key),
           let loadedObject = try? NSKeyedUnarchiver.unarchivedObject(ofClass: Object.self, from: savedData) {
            return loadedObject
        }
        return nil
    }
}

//MARK: - Specific only for Password
extension SFCacheDefault: UserInfoRequestProtocol {
    func saveUsername(_ username: String) {
        setValue(username, forKey: Constants.usernameAutoLOgin)
    }
    
    func savePassword(_ password: String) {
        guard let asePassword = password.encodeASE(key: Constants.passwordAutoLOgin) else {
            return
        }
        setValue(asePassword, forKey: Constants.passwordAutoLOgin)
    }
    
    func getUsername() -> String? {
        let username = getValuefor(key: Constants.usernameAutoLOgin) as? String
        return username
    }
    
    func getPassword() -> String? {
        guard let password = getValuefor(key: Constants.passwordAutoLOgin) as? String,
              let asePassword = password.decodeASE(key: Constants.passwordAutoLOgin) else {
            return nil
        }
        
        return asePassword
    }
    
    func saveAccessToken(_ token: String) {
        cache.insertValue(token, forKey: kAccessTokenKey)
    }
    
    func getAccessToken() -> String? {
        let token = cache.valueForKey(kAccessTokenKey)
        return token
    }
}
