//
//  UserRepository.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol UserRepository {
    func getUserBasicInfo(_ getUserBasicInfoEntity: GetUserBasicInfoRequest) async -> GetUserBasicInfoEntity
    func updateUserBasicInfo(_ updateUserBasicInfoEntity: UpdateUserBasicInfoRequest) async -> UpdateUserBasicInfoEntity
    func changeUserPassword(_ changeUserPasswordEntity: ChangeUserPasswordRequest) async -> ChangeUserPasswordEntity
    func getUserList(_ getUserListEntity: GetUserListRequest) async -> GetUserListEntity
    func updateRemoveUserAvatar(_ updateRemoveUserAvatarEntity: UpdateRemoveUserAvatarRequest) async -> UpdateRemoveUserAvatarEntity
    
}
