//
//  LoginDataSource.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol AuthDataSource {
    func authLogin(_ request: LoginRequestEntity) async throws -> Result<LoginModel?, XpertError>
    func authLogout(_ logoutEntity: LogoutRequestEntity, _ completion: @escaping (LogoutModel?, Bool) -> Void)
}

class AuthDataSourceAPIImpl: AuthDataSource {
    func authLogin(_ request: LoginRequestEntity) async throws -> Result<LoginModel?, XpertError> {
        let loginPath = APIFlowManager.defautlWebServer + "/oauth/x.php";
        guard let url = URL(string: loginPath) else {
            return .failure(XpertError(.error_100))
        }
        
        let verifyCode = request.getVerifyCodeSF()
        
        let mulDict: [String: Any] = [
            "c" : verifyCode,
            "u" : request.userId,
            "p" : request.pass,
            "ver_name" : request.verName,
            "ver_major" : request.verMajor,
            "ver_minor" : request.verMinor,
            "dev" : "{\"devicename\":\"\(request.deviceName)\",\"deviceid\":\"\(request.uuid)\",\"model\":\"\(request.model)\", \"serialno\":\"\", \"platform\":\"macos\", \"clienttype\":\"\("esfp")\"}",
            "t" : request.accessToken
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: mulDict, options: [])
            var jsonStr = String(data: jsonData, encoding: .utf8) ?? ""
            jsonStr = jsonStr.replacingOccurrences(of: "\n", with: "")
            
            let strContent = NgnStringUtils.md5(jsonStr) + jsonStr
                
            let startIndex = NgnStringUtils.md5(verifyCode).index(verifyCode.startIndex, offsetBy: 8)
            let endIndex = NgnStringUtils.md5(verifyCode).index(verifyCode.startIndex, offsetBy: 23)
            let key = String(NgnStringUtils.oddString(String(NgnStringUtils.md5(verifyCode)[startIndex...endIndex])))
                
            guard let strEncyrpt = NgnCryptorHelper.encrypt(strContent, key: key, iv: verifyCode),
                  let strFinal = NgnStringUtils.urlEncodedString(strEncyrpt) else {
                return .failure(XpertError(.error_100))
            }
            let post = "x=\(strFinal)"
            let data = post.data(using: .utf8)
            
            let response: Result<Data, Error> = try await withCheckedThrowingContinuation { continuation in
                CommonAPI.requestAPI(url, parameters: data) { results in
                    continuation.resume(returning: results)
                }
            }
            
            switch response {
            case .success(let data):
                let decoder = JSONDecoder()
                let login = try? decoder.decode(LoginModel.self, from: data)
                return .success(login)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }
    
    func authLogout(_ logoutEntity: LogoutRequestEntity,_ completion: @escaping (LogoutModel?, Bool) -> Void) {
        let loginPath = APIFlowManager.defautlWebServer + "/oauth/x.php";
        guard let url = URL(string: loginPath) else {
            return
        }
        
        let strContent = "{\"c\":\"\(logoutEntity.capcha)\",\"t\":\"%\(logoutEntity.accessToken)\",\"signout\":\"1\"}"
            
        let verifyCode = ""
        let startIndex = NgnStringUtils.md5(verifyCode).index(verifyCode.startIndex, offsetBy: 8)
        let endIndex = NgnStringUtils.md5(verifyCode).index(verifyCode.startIndex, offsetBy: 23)
        let key = String(NgnStringUtils.oddString(String(NgnStringUtils.md5(verifyCode)[startIndex...endIndex])))
            
        guard let strEncyrpt = NgnCryptorHelper.encrypt(strContent, key: key, iv: verifyCode),
              let strFinal = NgnStringUtils.urlEncodedString(strEncyrpt) else {
            return
        }
        let post = "x=\(strFinal)"
        let data = post.data(using: .utf8)
        
        CommonAPI.requestAPI(url, parameters: data) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                let logout = try? decoder.decode(LogoutModel.self, from: data)
                completion(logout, true)
            case .failure(_):
                completion(nil, false)
            }
        }
    }
}
