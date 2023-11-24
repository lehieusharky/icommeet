//
//  UserGroupUseCase.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation

class UserGroupUseCase {
    private(set) var repository: UserGroupRepository
    
    init(repository: UserGroupRepository) {
        self.repository = repository
    }
    
    func getUserGroupTree(_ getUserGroupTreeEntity: GetUserGroupTreeRequest) async throws -> GetUserGroupTreeEntity {
        let results = try await repository.getUserGroupTree(getUserGroupTreeEntity)
        
        switch results {
        case .success(let success):
            return GetUserGroupTreeEntity(success)
        case .failure(let failure):
            return GetUserGroupTreeEntity(failure)
        }
    }

    func getUserGroupTree2(_ getUserGroupTree2Entity: GetUserGroupTree2Request) async throws -> GetUserGroupTree2Entity {
        let results = try await repository.getUserGroupTree2(getUserGroupTree2Entity)
        
        switch results {
        case .success(let success):
            return GetUserGroupTree2Entity(success)
        case .failure(let failure):
            return GetUserGroupTree2Entity(failure)
        }
    }

    func getGroupUser(_ getGroupUserEntity: GetGroupUserRequest) async throws -> GetGroupUserEntity {
        let results = try await repository.getGroupUser(getGroupUserEntity)
        
        switch results {
        case .success(let success):
            return GetGroupUserEntity(success)
        case .failure(let failure):
            return GetGroupUserEntity(failure)
        }
    }
}

