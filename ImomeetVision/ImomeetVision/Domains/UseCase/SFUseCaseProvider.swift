//
//  SFUseCaseProvider.swift
//  ImomeetVision
//
//  Created by Thien Vu on 05/10/2023.
//

import Foundation

class SFUseCaseProvider: SFUseCase {
    static let sharedInstance = SFUseCaseProvider()
    
    private var sfRepository: SFRepository
    
    private init() {
        sfRepository = SFRepositoryProvider()
    }
    
    func loginUsecase() -> AuthUseCase {
        let repository = sfRepository.loginRepository()
        return AuthUseCase(repository: repository)
    }
}
