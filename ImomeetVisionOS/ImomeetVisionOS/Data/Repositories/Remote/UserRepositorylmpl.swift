//
//  UserRepositoryImpl.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class UserRepositoryImpl: UserRepository {
    
    private(set) var dataSource: UserDataSource?
    
    init(dataSource: UserDataSource? = nil) {
        self.dataSource = dataSource
    }
    
    func getUserBasicInfo(_ getUserBasicInfoEntity: GetUserBasicInfoRequest) async -> GetUserBasicInfoEntity {
        guard let dataSource = dataSource as? UserDataSourceAPIImpl else {
            return GetUserBasicInfoEntity(XpertError(.error_100))
        }
        
        let results = try await dataSource.getUserBasicInfo(getUserBasicInfoEntity)
        
        switch results {
        case .success(let model):
            return GetUserBasicInfoEntity(model)
        case .failure(let error):
            return GetUserBasicInfoEntity(error)
        }
    }

    func updateUserBasicInfo(_ updateUserBasicInfoEntity: UpdateUserBasicInfoRequest) async -> UpdateUserBasicInfoEntity {
        guard let dataSource = dataSource as? UserDataSourceAPIImpl else {
            return UpdateUserBasicInfoEntity(XpertError(.error_100))
        }
        
        let results = try await dataSource.updateUserBasicInfo(updateUserBasicInfoEntity)
        
        switch results {
        case .success(let model):
            return UpdateUserBasicInfoEntity(model)
        case .failure(let error):
            return UpdateUserBasicInfoEntity(error)
        }
    }

    func changeUserPassword(_ changeUserPasswordEntity: ChangeUserPasswordRequest) async -> ChangeUserPasswordEntity {
        guard let dataSource = dataSource as? UserDataSourceAPIImpl else {
            return ChangeUserPasswordEntity(XpertError(.error_100))
        }
        
        let results = try await dataSource.changeUserPassword(changeUserPasswordEntity)
        
        switch results {
        case .success(let model):
            return ChangeUserPasswordEntity(model)
        case .failure(let error):
            return ChangeUserPasswordEntity(error)
        }
    }

    func getUserList(_ getUserListEntity: GetUserListRequest) async -> GetUserListEntity {
         guard let dataSource = dataSource as? UserDataSourceAPIImpl else {
            return GetUserListEntity(XpertError(.error_100))
        }
        
        let results = try await dataSource.getUserList(getUserListEntity)
        
        switch results {
        case .success(let model):
            return GetUserListEntity(model)
        case .failure(let error):
            return GetUserListEntity(error)
        }
    }

    func updateRemoveUserAvatar(_ updateRemoveUserAvatarEntity: UpdateRemoveUserAvatarRequest) async -> UpdateRemoveUserAvatarEntity {
        guard let dataSource = dataSource as? UserDataSourceAPIImpl else {
            return UpdateRemoveUserAvatarEntity(XpertError(.error_100))
        }
        
        let results = try await dataSource.updateRemoveUserAvatar(updateRemoveUserAvatarEntity)
        
        switch results {
        case .success(let model):
            return UpdateRemoveUserAvatarEntity(model)
        case .failure(let error):
            return UpdateRemoveUserAvatarEntity(error)
        }
    }
}

