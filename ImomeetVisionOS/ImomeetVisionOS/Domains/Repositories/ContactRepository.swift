//
//  ContactRepository.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol ContactRepository {
    var dataSource: ContactDataSource? { get }
    
    func getContactList(_ contactListEntity: ContactListRequest) async throws -> Result<ContactListModel, XpertError>
    func getContactInfo(_ contactInfoEntity: ContactInfoRequest) async throws -> Result<ContactInfoModel?, XpertError>
    func removeContact(_ removeContactEntity: RemoveContactRequest) async throws -> Result<RemoveContactModel?, XpertError>
    func addContact(_ addContactEntity: AddContactRequest) async throws -> Result<AddContactModel?, XpertError>
    func changeContactGroupName(_ changeContactGroupNameEntity: ChangeContactGroupNameRequest) async throws -> Result<ChangeContactGroupNameModel?, XpertError>
    func removeContactGroup(_ removeContactGroupEntity: RemoveContactGroupRequest) async throws -> Result<RemoveContactGroupModel?, XpertError>
   
}

