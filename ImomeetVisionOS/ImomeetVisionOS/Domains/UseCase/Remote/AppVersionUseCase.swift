//
//  AppVersionUseCase.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation

class AppVersionUseCase {
    private(set) var repository: AppVersionRepository
    
    init(repository: AppVersionRepository) {
        self.repository = repository
    }
    
    func checkAppVersion(_ checkAppVersionEntity: CheckAppVersionRequest) async throws -> CheckAppVersionEntity? {
        let results = try await repository.checkAppVersion(checkAppVersionEntity)
        
        switch results {
        case .success(let success):
            return CheckAppVersionEntity(success)
        case .failure(let failure):
            return CheckAppVersionEntity(failure)
        }
    }
}

