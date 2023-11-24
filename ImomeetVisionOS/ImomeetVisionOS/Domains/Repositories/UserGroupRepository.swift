//
//  UserGroupRepository.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol UserGroupRepository {
    func getUserGroupTree(_ getUserGroupTreeEntity: GetUserGroupTreeRequest) async throws -> Result<GetUserGroupTreeModel?, XpertError>
    func getUserGroupTree2(_ getUserGroupTree2Entity: GetUserGroupTree2Request) async throws -> Result<GetUserGroupTree2Model?, XpertError>
    func getGroupUser(_ getGroupUserEntity: GetGroupUserRequest) async throws -> Result<GetGroupUserModel?, XpertError>

}
