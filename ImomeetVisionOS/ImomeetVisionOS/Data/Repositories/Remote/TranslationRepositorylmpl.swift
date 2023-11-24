//
//  TranslationRepositoryImpl.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class TranslationRepositoryImpl: TranslationRepository {
    
    private(set) var dataSource: TranslationDataSource?
    
    init(dataSource: TranslationDataSource? = nil) {
        self.dataSource = dataSource
    }
    
    func inputTranslation(_ inputTranslationEntity: InputTranslationRequest) async -> InputTranslationEntity {
        guard let dataSource = dataSource as? TranslationDataSourceAPIImpl else {
            return InputTranslationEntity(XpertError(.error_100))
        }
        
        let results = try await dataSource.inputTranslation(inputTranslationEntity)
        
        switch results {
        case .success(let model):
            return InputTranslationEntity(model)
        case .failure(let error):
            return InputTranslationEntity(error)
        }
    }

}

