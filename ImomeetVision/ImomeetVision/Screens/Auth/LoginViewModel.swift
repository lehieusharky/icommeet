//
//  LoginViewModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class LoginViewModel: BaseViewModel {
    var loginUsecase: AuthUseCase
    
    var loginEntity: LoginEntity?
    var loginErrorEntity: AuthEntityFailure?
    
    override init() {
        self.loginUsecase = SFUseCaseProvider.sharedInstance.loginUsecase()
        super.init()
    }
    
    deinit {
        LogSF.LogTrace("Realease LoginViewModel")
    }
    
    public func cacheUserInfo(user: String, pasword: String) -> Bool {
        guard !user.isEmpty && !pasword.isEmpty else {
            return false
        }
        
        SFUserdefault.shared.saveUsername(user)
        return SFUserdefault.shared.savePassword(pasword)
    }
}

extension LoginViewModel {
    public func loginWith(_ username: String, password: String) async -> Bool {
        let request = LoginRequestEntity(userId: username,
                                             pass: password,
                                             verifyCode: "^C0dE",
                                             verName: "esfp.ios",
                                             verMajor: "4",
                                             verMinor: "6.75",
                                             verBuild: "76",
                                             accessToken: "",
                                             deviceName: "iPhone14,2",
                                             uuid: "ios",
                                             model: "785D32CA-B69C-4151-BF5A-9363364B70A9")

        do {
            let results: SFResult<LoginEntity, AuthEntityFailure>? = try await loadData { [weak self] in
                guard let self = self else {
                    return nil
                }
                
                let results = try await self.loginUsecase.loginWith(request)
                return results
            }
            
            if let results = results {
                switch results {
                case .success(let success):
                    self.loginEntity = success
                    return true
                case .failure(let failure):
                    self.loginErrorEntity = failure
                    return false
                }
            }
            
        } catch {
            LogSF.LogError("Login not successed")
        }
        
        return false
    }
}
