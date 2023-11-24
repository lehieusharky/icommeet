//
//  LoginRepository.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class AuthRepositoryImpl: AuthRepository {
    private(set) var dataSource: AuthDataSource?
    
    init(dataSource: AuthDataSource? = nil) {
        self.dataSource = dataSource
    }
    
    func loginWith(_ loginEntity: LoginRequest) async -> LoginEntity {
        guard let dataSource = dataSource as? AuthDataSourceAPIImpl else {
            return LoginEntity(XpertError(.error_100))
        }

        dataSource.authLogin(loginEntity) { model, success  in
            if success,
               let model = model {
                completion(LoginEntity(model))
                return
            }
            
            completion(LoginEntity(XpertError(.error_100)))
        }
    }
    
    func logout(_ logoutEntity: LogoutRequest,_ completion: @escaping (LogoutEntity) -> Void) {
        guard let dataSource = dataSource as? AuthDataSourceAPIImpl else {
            return completion(LogoutEntity(XpertError(.error_100)))
        }
        
        dataSource.authLogout(logoutEntity) { model, success  in
            if success,
               let model = model {
                completion(LogoutEntity(model))
                return
            }
            
            completion(LogoutEntity(XpertError(.error_100)))
        }
    }
}
