//
//  ContactRepository.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol ContactRepository {
    var dataSource: ContactDataSource? { get }
    
    func getContactList(_ contactListEntity: ContactListRequest) async -> ContactListStateEntity
    func getContactInfo(_ contactInfoEntity: ContactInfoRequest) async -> ContactInfoStateEntity
    func removeContact(_ removeContactEntity: RemoveContactRequest) async -> RemoveContactStateEntity
    func addContact(_ addContactEntity: AddContactRequest) async -> AddContactStateEntity
    func changeContactGroupName(_ changeContactGroupNameEntity: ChangeContactGroupNameRequest) async -> ChangeContactGroupNameStateEntity
    func removeContactGroup(_ removeContactGroupEntity: RemoveContactGroupRequest) async -> RemoveContactGroupStateEntity
   
}

