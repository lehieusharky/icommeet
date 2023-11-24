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
    
    func inputTranslation(_ inputTranslationEntity: InputTranslationRequest) async throws -> Result<InputTranslationModel?, XpertError> {
        guard let dataSource = dataSource as? TranslationDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.inputTranslation(inputTranslationEntity)
        
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

}

