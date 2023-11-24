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
    
    func loginWith(_ loginEntity: LoginRequestEntity) async throws -> Result<LoginModel?, XpertError> {
        guard let dataSource = dataSource as? AuthDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.authLogin(loginEntity)
        
        switch results {
        case .success(let model):
            guard let model = model else {
                return .success(nil)
            }
            return .success(model)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func logout(_ logoutEntity: LogoutRequestEntity,_ completion: @escaping (Result<LogoutModel, XpertError>) -> Void) {
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
