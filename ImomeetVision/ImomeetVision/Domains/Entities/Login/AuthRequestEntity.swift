//
//  LoginRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class LoginRequestEntity {
    var userId: String
    var pass: String
    var verifyCode: String
    var verName: String
    var verMajor: String
    var verMinor: String
    var verBuild: String
    var accessToken: String
    var deviceName: String
    var uuid: String
    var model: String
    
    init(userId: String, 
         pass: String,
         verifyCode: String,
         verName: String,
         verMajor: String,
         verMinor: String,
         verBuild: String,
         accessToken: String,
         deviceName: String,
         uuid: String,
         model: String) {
        self.userId = userId
        self.pass = pass
        self.verifyCode = verifyCode
        self.verName = verName
        self.verMajor = verMajor
        self.verMinor = verMinor
        self.verBuild = verBuild
        self.accessToken = accessToken
        self.deviceName = deviceName
        self.uuid = uuid
        self.model = model
    }
    
    public func getVerifyCodeSF() -> String {
        return "sfx\(verifyCode)".lowercased();
    }
}

class LogoutRequestEntity  {
    var capcha: String
    var accessToken: String
    
    init(capcha: String, accessToken: String) {
        self.capcha = capcha
        self.accessToken = accessToken
    }
}
