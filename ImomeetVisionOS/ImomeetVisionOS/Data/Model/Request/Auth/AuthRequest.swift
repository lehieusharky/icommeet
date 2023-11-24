//
//  LoginRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class LoginRequest {
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
    
    func toBody() -> [String : Any] {
        let verifyCode = getVerifyCodeSF()
        
        let mulDict: [String: Any] = [
            "c" : verifyCode,
            "u" : self.userId,
            "p" : self.pass,
            "ver_name" : self.verName,
            "ver_major" : self.verMajor,
            "ver_minor" : self.verMinor,
            "dev" : "{\"devicename\":\"\(self.deviceName)\",\"deviceid\":\"\(self.uuid)\",\"model\":\"\(self.model)\", \"serialno\":\"\", \"platform\":\"macos\", \"clienttype\":\"\("esfp")\"}",
            "t" : self.accessToken
        ]
        
        return mulDict
    }
    
    func convertBodyToHashData() throws -> Data? {
        let verifyCode = getVerifyCodeSF()
        let mulDict = toBody()
        
        let jsonData = try JSONSerialization.data(withJSONObject: mulDict, options: [])
        var jsonStr = String(data: jsonData, encoding: .utf8) ?? ""
        jsonStr = jsonStr.replacingOccurrences(of: "\n", with: "")
        
        let strContent = NgnStringUtils.md5(jsonStr) + jsonStr
            
        let startIndex = NgnStringUtils.md5(verifyCode).index(verifyCode.startIndex, offsetBy: 8)
        let endIndex = NgnStringUtils.md5(verifyCode).index(verifyCode.startIndex, offsetBy: 23)
        let key = String(NgnStringUtils.oddString(String(NgnStringUtils.md5(verifyCode)[startIndex...endIndex])))
            
        guard let strEncyrpt = NgnCryptorHelper.encrypt(strContent, key: key, iv: verifyCode),
              let strFinal = NgnStringUtils.urlEncodedString(strEncyrpt) else {
            return nil
        }
        let post = "x=\(strFinal)"
        
        return post.data(using: .utf8)
    }
}

class LogoutRequest {
    var capcha: String
    var accessToken: String
    
    init(capcha: String, accessToken: String) {
        self.capcha = capcha
        self.accessToken = accessToken
    }
    
    func convertBodyToHashData() -> Data? {
        let strContent = "{\"c\":\"\(self.capcha)\",\"t\":\"%\(self.accessToken)\",\"signout\":\"1\"}"
            
        let verifyCode = ""
        let startIndex = NgnStringUtils.md5(verifyCode).index(verifyCode.startIndex, offsetBy: 8)
        let endIndex = NgnStringUtils.md5(verifyCode).index(verifyCode.startIndex, offsetBy: 23)
        let key = String(NgnStringUtils.oddString(String(NgnStringUtils.md5(verifyCode)[startIndex...endIndex])))
            
        guard let strEncyrpt = NgnCryptorHelper.encrypt(strContent, key: key, iv: verifyCode),
              let strFinal = NgnStringUtils.urlEncodedString(strEncyrpt) else {
            return nil
        }
        let post = "x=\(strFinal)"
        return post.data(using: .utf8)
    }
}
