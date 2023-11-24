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
    
    func loginWith(_ loginEntity: LoginRequest) async throws -> Result<LoginModel, XpertError> {
        guard let dataSource = dataSource as? AuthDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        return try await dataSource.authLogin(loginEntity)
    }
    
    func logout(_ logoutEntity: LogoutRequest,_ completion: @escaping (Result<LogoutModel, XpertError>) -> Void) {
        guard let dataSource = dataSource as? AuthDataSourceAPIImpl else {
            return completion(.failure(XpertError(.error_100)))
        }
        
        dataSource.authLogout(logoutEntity) { model, success  in
            if success,
               let model = model {
                completion(.success(model))
                return
            }
            
            completion(.failure(XpertError(.error_100)))
        }
    }
}
