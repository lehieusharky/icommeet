//
//  LoginUseCase.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation

class AuthUseCase {
    private(set) var repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func loginWith(_ loginEntity: LoginRequestEntity) async throws -> SFResult<LoginEntity, AuthEntityFailure> {
        let results = try await repository.loginWith(loginEntity)
        
        switch results {
        case .success(let success):
            guard let error = success?.errorX else {
                return .success(LoginEntity(success))
            }
            
            return .failure(AuthEntityFailure(error: error))
        case .failure(let failure):
            return .failure(AuthEntityFailure(error: failure))
        }
    }
    
    func logout(_ logoutEntity: LogoutRequestEntity, completion: @escaping (SFResult<LogoutEntity, AuthEntityFailure>) -> Void) {
        repository.logout(logoutEntity) { results in
            switch results {
            case .success(let success):
                completion(.success(LogoutEntity(success)))
            case .failure(let failure):
                completion(.failure(AuthEntityFailure(error: failure)))
            }
        }
    }
}
