//
//  LoginEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class LoginEntity: BaseEntity<LoginModel> {
    override init(_ model: LoginModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
    
    func parseJWT(_ capcha: String) throws -> [String: Any]? {
        do {
            let strRet = NgnWebServiceUtils.getStringDecrypted(from: model?.x ?? "", withVerifyCode: capcha)
            
            if let data = strRet?.data(using: .utf8) {
                let ret = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                let data = try JSONSerialization.data(withJSONObject: ret, options: .prettyPrinted)
                let jsonStr = String(data: data, encoding: .utf8)
                LogSF.LogTrace("Log in response: \(jsonStr ?? "")")
                
                if let ret = ret as? [String: Any] {
                    return ret
                }
            }
            return nil
        } catch {
            return nil
        }
    }
}

class LogoutEntity: BaseEntity<LogoutModel> {
    override init(_ model: LogoutModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
}
