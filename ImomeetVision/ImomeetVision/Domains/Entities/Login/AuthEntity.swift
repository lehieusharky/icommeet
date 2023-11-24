//
//  LoginEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol AuthStateEntity {}

class AuthEntityFailure: AuthStateEntity {
    private(set) var error: XpertError?
    
    init(error: XpertError? = nil) {
        self.error = error
    }
}

class LoginEntity: AuthStateEntity {
    private(set) var model: LoginModel?
    
    init(_ model: LoginModel?) {
        self.model = model
    }
}

class LogoutEntity: AuthStateEntity {
    private(set) var model: LogoutModel?
    
    init(_ model: LogoutModel?) {
        self.model = model
    }
}
