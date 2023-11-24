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
    
    func getUserGroupTree(_ getUserGroupTreeEntity: GetUserGroupTreeRequest) async -> GetUserGroupTreeEntity {
        guard let dataSource = dataSource as? UserGroupDataSourceAPIImpl else {
            return GetUserGroupTreeEntity(XpertError(.error_100))
        }
        
        let results = try await dataSource.getUserGroupTree(getUserGroupTreeEntity)
        
        switch results {
        case .success(let model):
            return GetUserGroupTreeEntity(model)
        case .failure(let error):
            return GetUserGroupTreeEntity(error)
        }
    }

    func getUserGroupTree2(_ getUserGroupTree2Entity: GetUserGroupTree2Request) async -> GetUserGroupTree2Entity {
        guard let dataSource = dataSource as? UserGroupDataSourceAPIImpl else {
            return GetUserGroupTree2Entity(XpertError(.error_100))
        }
        
        let results = try await dataSource.getUserGroupTree2(getUserGroupTree2Entity)
        
        switch results {
        case .success(let model):
            return GetUserGroupTree2Entity(model)
        case .failure(let error):
            return GetUserGroupTree2Entity(error)
        }
    }

    func getGroupUser(_ getGroupUserEntity: GetGroupUserRequest) async -> GetGroupUserEntity {
        guard let dataSource = dataSource as? UserGroupDataSourceAPIImpl else {
            return GetGroupUserEntity(XpertError(.error_100))
        }
        
        let results = try await dataSource.getGroupUser(getGroupUserEntity)
        
        switch results {
        case .success(let model):
            return GetGroupUserEntity(model)
        case .failure(let error):
            return GetGroupUserEntity(error)
        }
    }

}

