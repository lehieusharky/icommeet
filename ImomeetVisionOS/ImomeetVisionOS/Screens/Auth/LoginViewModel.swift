//
//  LoginViewModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class LoginViewModel: BaseViewModel {
    @Dependency
    private var authUseCase: AuthUseCase
    
    var loginEntity: LoginEntity?
    
    deinit {
        LogSF.LogTrace("Realease LoginViewModel")
    }
    
}

extension LoginViewModel {
    public func loginWith(_ username: String, password: String) async -> Bool {
        let request = LoginRequest(userId: username,
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
            loginEntity = try await self.authUseCase.loginWith(request)
            return loginEntity?.error != nil ? false : true
        } catch {
            return false
        }
    }
}
