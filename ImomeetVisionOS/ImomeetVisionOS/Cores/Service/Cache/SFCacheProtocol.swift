//
//  SFCacheProtocol.swift
//  ImomeetVision
//
//  Created by Thien Vu on 04/10/2023.
//

import Foundation

protocol UserDefaultProtocol {
    func setRuntimeValue(_ value: Any?, forKey _key: String)
    
    func setValue(_ value: Any?, forKey _key: String)
    func getValuefor(key: String) -> Any?
    
    func setValue(_ value: Any?, forKeyPath _key: String)
    func getValuefor(keyPath: String) -> Any?
    
    func removeValueFor(key: String)
    
    func setObject<Object: NSCoding>(object: Object, forKey key: String)
    func getObjectFor<Object: CodingObject>(key: String) -> Object?
}

protocol UserInfoRequestProtocol {
    func saveUsername(_ username: String)
    func getUsername() -> String?
    
    func savePassword(_ password: String)
    func getPassword() -> String?
    
    func saveAccessToken(_ token: String)
    func getAccessToken() -> String?
}
