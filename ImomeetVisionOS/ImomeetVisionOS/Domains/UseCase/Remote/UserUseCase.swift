//
//  UserUseCase.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation

class UserUseCase {
    private(set) var repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func getUserBasicInfo(_ getUserBasicInfoEntity: GetUserBasicInfoRequest) async throws -> GetUserBasicInfoEntity {
        let results = try await repository.getUserBasicInfo(getUserBasicInfoEntity)
        
        switch results {
        case .success(let success):
            return GetUserBasicInfoEntity(success)
        case .failure(let failure):
            return GetUserBasicInfoEntity(failure)
        }
    }

    func updateUserBasicInfo(_ updateUserBasicInfoEntity: UpdateUserBasicInfoRequest) async throws -> UpdateUserBasicInfoEntity {
        let results = try await repository.updateUserBasicInfo(updateUserBasicInfoEntity)
        
        switch results {
        case .success(let success):
            return UpdateUserBasicInfoEntity(success)
        case .failure(let failure):
            return UpdateUserBasicInfoEntity(failure)
        }
    }

    func changeUserPassword(_ changeUserPasswordEntity: ChangeUserPasswordRequest) async throws -> ChangeUserPasswordEntity {
        let results = try await repository.changeUserPassword(changeUserPasswordEntity)
        
        switch results {
        case .success(let success):
            return ChangeUserPasswordEntity(success)
        case .failure(let failure):
            return ChangeUserPasswordEntity(failure)
        }
    }

    func getUserList(_ getUserListEntity: GetUserListRequest) async throws -> GetUserListEntity {
        let results = try await repository.getUserList(getUserListEntity)
        
        switch results {
        case .success(let success):
            return GetUserListEntity(success)
        case .failure(let failure):
            return GetUserListEntity(failure)
        }
    }

    func updateRemoveUserAvatar(_ updateRemoveUserAvatarEntity: UpdateRemoveUserAvatarRequest) async throws -> UpdateRemoveUserAvatarEntity {
        let results = try await repository.updateRemoveUserAvatar(updateRemoveUserAvatarEntity)
        
        switch results {
        case .success(let success):
            return UpdateRemoveUserAvatarEntity(success)
        case .failure(let failure):
            return UpdateRemoveUserAvatarEntity(failure)
        }
    }
}

