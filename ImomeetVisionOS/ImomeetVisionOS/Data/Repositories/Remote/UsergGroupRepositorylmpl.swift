//
//  UserGroupRepositoryImpl.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class UserGroupRepositoryImpl: UserGroupRepository {
    
    private(set) var dataSource: UserGroupDataSource?
    
    init(dataSource: UserGroupDataSource? = nil) {
        self.dataSource = dataSource
    }
    
    func getUserGroupTree(_ getUserGroupTreeEntity: GetUserGroupTreeRequest) async throws -> Result<GetUserGroupTreeModel?, XpertError> {
        guard let dataSource = dataSource as? UserGroupDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.getUserGroupTree(getUserGroupTreeEntity)
        
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

    func getUserGroupTree2(_ getUserGroupTree2Entity: GetUserGroupTree2Request) async throws -> Result<GetUserGroupTree2Model?, XpertError> {
        guard let dataSource = dataSource as? UserGroupDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.getUserGroupTree2(getUserGroupTree2Entity)
        
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

    func getGroupUser(_ getGroupUserEntity: GetGroupUserRequest) async throws -> Result<GetGroupUserModel?, XpertError> {
        guard let dataSource = dataSource as? UserGroupDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.getGroupUser(getGroupUserEntity)
        
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

