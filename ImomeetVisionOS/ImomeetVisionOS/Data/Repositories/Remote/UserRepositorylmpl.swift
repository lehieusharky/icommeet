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
    
    func getUserBasicInfo(_ getUserBasicInfoEntity: GetUserBasicInfoRequest) async throws -> Result<GetUserBasicInfoModel?, XpertError> {
        guard let dataSource = dataSource as? UserDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.getUserBasicInfo(getUserBasicInfoEntity)
        
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

    func updateUserBasicInfo(_ updateUserBasicInfoEntity: UpdateUserBasicInfoRequest) async throws -> Result<UpdateUserBasicInfoModel?, XpertError> {
        guard let dataSource = dataSource as? UserDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.updateUserBasicInfo(updateUserBasicInfoEntity)
        
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

    func changeUserPassword(_ changeUserPasswordEntity: ChangeUserPasswordRequest) async throws -> Result<ChangeUserPasswordModel?, XpertError> {
        guard let dataSource = dataSource as? UserDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.changeUserPassword(changeUserPasswordEntity)
        
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

    func getUserList(_ getUserListEntity: GetUserListRequest) async throws -> Result<GetUserListModel?, XpertError> {
         guard let dataSource = dataSource as? UserDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.getUserList(getUserListEntity)
        
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

    func updateRemoveUserAvatar(_ updateRemoveUserAvatarEntity: UpdateRemoveUserAvatarRequest) async throws -> Result<UpdateRemoveUserAvatarModel?, XpertError> {
        guard let dataSource = dataSource as? UserDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.updateRemoveUserAvatar(updateRemoveUserAvatarEntity)
        
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

