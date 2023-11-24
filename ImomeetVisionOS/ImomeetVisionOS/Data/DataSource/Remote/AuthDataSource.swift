//
//  LoginDataSource.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol AuthDataSource {
    func authLogin(_ request: LoginRequest) async throws -> Result<LoginModel, XpertError>
    func authLogout(_ request: LogoutRequest, _ completion: @escaping (LogoutModel?, Bool) -> Void)
}

class AuthDataSourceAPIImpl: AuthDataSource {
    func authLogin(_ request: LoginRequest) async throws -> Result<LoginModel, XpertError> {
        let loginPath = NetworkConstant.defautlWebServer + "/oauth/x.php";
        guard let url = URL(string: loginPath) else {
            return .failure(XpertError(.error_100))
        }
        
        if let data = try request.convertBodyToHashData() {
            let response: Result<Data, Error> = try await withCheckedThrowingContinuation { continuation in
                CommonAPI.requestAPI(url, parameters: data) { results in
                    continuation.resume(returning: results)
                }
            }
            
            switch response {
            case .success(let data):
                let decoder = JSONDecoder()
                if let login = try? decoder.decode(LoginModel.self, from: data) {
                    return .success(login)
                } else {
                    return .failure(XpertError(.error_100))
                }
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        }
        
        return .failure(XpertError(.error_100))
    }
    
    func authLogout(_  request: LogoutRequest,_ completion: @escaping (LogoutModel?, Bool) -> Void) {
        let loginPath = NetworkConstant.defautlWebServer + "/oauth/x.php";
        guard let url = URL(string: loginPath) else {
            return
        }
        
        CommonAPI.requestAPI(url, parameters: request.convertBodyToHashData()) { result in
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
