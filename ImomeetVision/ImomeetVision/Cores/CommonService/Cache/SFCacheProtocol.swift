//
//  SFCacheProtocol.swift
//  ImomeetVision
//
//  Created by Thien Vu on 04/10/2023.
//

import Foundation

protocol UserDefaultProtocol {
    func setValue(_ value: Any?, forKey _key: String)
    func getValuefor(key: String) -> Any?
    func setValue(_ value: Any?, forKeyPath _key: String)
    func getValuefor(keyPath: String) -> Any?
}

protocol UserInfoRequestProtocol {
    func saveUsername(_ username: String)
    func getUsername() -> String?
    
    func savePassword(_ password: String) -> Bool
    func getPassword() -> String?
    
    func saveAccessToken(_ token: String)
    func getAccessToken() -> String?
}
