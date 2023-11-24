//
//  AppVersionRepository.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class AppVersionRepositoryImpl: AppVersionRepository {
    
    private(set) var dataSource: AppVersionDataSource?
    
    init(dataSource: AppVersionDataSource? = nil) {
        self.dataSource = dataSource
    }
    
    func checkAppVersion(_ checkAppVersionEntity: CheckAppVersionRequest) async -> CheckAppVersionEntity {
        guard let dataSource = dataSource as? AppVersionDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.checkAppVersion(checkAppVersionEntity)
        
        switch results {
        case .success(let model):
            guard let model = model else {
                // TODO
                return .success(nil)
            }
            return CheckAppVersionEntity(model)
        case .failure(let error):
            return CheckAppVersionEntity(error)
        }
    }
}

