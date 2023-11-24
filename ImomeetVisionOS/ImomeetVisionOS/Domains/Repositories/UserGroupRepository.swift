//
//  UserGroupRepository.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol UserGroupRepository {
    func getUserGroupTree(_ getUserGroupTreeEntity: GetUserGroupTreeRequest) async -> GetUserGroupTreeEntity
    func getUserGroupTree2(_ getUserGroupTree2Entity: GetUserGroupTree2Request) async -> GetUserGroupTree2Entity
    func getGroupUser(_ getGroupUserEntity: GetGroupUserRequest) async -> GetGroupUserEntity

}
