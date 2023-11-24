//
//  UserRepository.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol UserRepository {
    func getUserBasicInfo(_ getUserBasicInfoEntity: GetUserBasicInfoRequest) async throws -> Result<GetUserBasicInfoModel?, XpertError>
    func updateUserBasicInfo(_ updateUserBasicInfoEntity: UpdateUserBasicInfoRequest) async throws -> Result<UpdateUserBasicInfoModel?, XpertError>
    func changeUserPassword(_ changeUserPasswordEntity: ChangeUserPasswordRequest) async throws -> Result<ChangeUserPasswordModel?, XpertError>
    func getUserList(_ getUserListEntity: GetUserListRequest) async throws -> Result<GetUserListModel?, XpertError>
    func updateRemoveUserAvatar(_ updateRemoveUserAvatarEntity: UpdateRemoveUserAvatarRequest) async throws -> Result<UpdateRemoveUserAvatarModel?, XpertError>
    
}
