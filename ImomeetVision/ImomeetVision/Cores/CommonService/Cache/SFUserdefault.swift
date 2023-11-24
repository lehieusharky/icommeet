//
//  SFUserdefault.swift
//  ImomeetVision
//
//  Created by Thien Vu on 04/10/2023.
//

import Foundation

class SFUserdefault {
    
    static let shared = SFUserdefault()
    
    let kUsernameKey = "kUsernameSFVision"
    let kPasswordKey = "kPasswordSFVision"
    let kAccessTokenKey = "kAccessTokenSFVision"
    
    private init() {}
}

extension SFUserdefault: UserDefaultProtocol {
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
}

extension SFUserdefault: UserInfoRequestProtocol {
    func saveUsername(_ username: String) {
        setValue(username, forKey: kUsernameKey)
    }
    
    func savePassword(_ password: String) -> Bool {
        guard let asePassword = password.encodeASE(key: kPasswordKey) else {
            return false
        }
        setValue(asePassword, forKey: kPasswordKey)
        return true
    }
    
    func getUsername() -> String? {
        let username = getValuefor(key: kUsernameKey) as? String
        return username
    }
    
    func getPassword() -> String? {
        guard let password = getValuefor(key: kPasswordKey) as? String,
              let asePassword = password.decodeASE(key: kPasswordKey) else {
            return nil
        }
        
        return asePassword
    }
    
    func saveAccessToken(_ token: String) {
        setValue(token, forKey: kAccessTokenKey)
    }
    
    func getAccessToken() -> String? {
        let token = getValuefor(key: kUsernameKey) as? String
        return token
    }
}
