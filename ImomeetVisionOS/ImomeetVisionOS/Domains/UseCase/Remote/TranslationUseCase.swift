//
//  TranslationUseCase.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation

class TranslationUseCase {
    private(set) var repository: TranslationRepository
    
    init(repository: TranslationRepository) {
        self.repository = repository
    }
    
    func inputTranslation(_ inputTranslationEntity: InputTranslationRequest) async throws -> InputTranslationEntity {
        let results = try await repository.inputTranslation(inputTranslationEntity)
        
        switch results {
        case .success(let success):
            return InputTranslationEntity(success)
        case .failure(let failure):
            return InputTranslationEntity(failure)
        }
    }
}

