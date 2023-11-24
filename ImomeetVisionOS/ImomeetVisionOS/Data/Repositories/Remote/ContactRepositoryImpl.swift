//
//  ContactRepositoryImpl.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 22/10/2023.
//

import Foundation

class ContactRepositoryImpl: ContactRepository {
    private(set) var dataSource: ContactDataSource?
    
    init(dataSource: ContactDataSource? = nil) {
        self.dataSource = dataSource
    }
    
    func getContactList(_ contactListEntity: ContactListRequest) async -> ContactListStateEntity {
        guard let dataSource = dataSource as? ContactDataSourceAPIImpl else {
            return ContactListEntityFailure(XpertError(.error_100))
        }
        
        guard let results = try? await dataSource.getContactList(contactListEntity) else {
            return ContactListEntityFailure(XpertError(.error_100))
        }
        
        return ContactListEntity(results)
    }
    
    func getContactInfo(_ contactInfoEntity: ContactInfoRequest) async -> ContactInfoStateEntity {
        guard let dataSource = dataSource as? ContactDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.getContactInfo(contactInfoEntity)
        
        switch results {
        case .success(let model):
            guard let model = model else {
                return .success(nil)
            }
            return ContactInfoEntity(model)
        case .failure(let error):
            return ContactInfoEntityFailure(error)
        }
    }

    func removeContact(_ removeContactEntity: RemoveContactRequest) async -> RemoveContactStateEntity {
        guard let dataSource = dataSource as? ContactDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.removeContact(removeContactEntity)
        
        switch results {
        case .success(let model):
            guard let model = model else {
                return .success(nil)
            }
            return RemoveContactEntity(model)
        case .failure(let error):
            return RemoveContactEntityFailure(error)
        }
    }


    func addContact(_ addContactEntity: AddContactRequest) async -> AddContactStateEntity {
        guard let dataSource = dataSource as? ContactDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.addContact(addContactEntity)
        
        switch results {
        case .success(let model):
            guard let model = model else {
                return .success(nil)
            }
            return AddContactEntity(model)
        case .failure(let error):
            return AddContactEntityFailure(error)
        }
    }

    func changeContactGroupName(_ changeContactGroupNameEntity: ChangeContactGroupNameRequest) async -> ChangeContactGroupNameStateEntity {
        guard let dataSource = dataSource as? ContactDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.changeContactGroupName(changeContactGroupNameEntity)
        
        switch results {
        case .success(let model):
            guard let model = model else {
                return .success(nil)
            }
            return ChangeContactGroupNameEntity(model)
        case .failure(let error):
            return ChangeContactGroupNameEntityFailure(error)
        }
    }

    func removeContactGroup(_ removeContactGroupEntity: RemoveContactGroupRequest) async -> RemoveContactGroupStateEntity {
         guard let dataSource = dataSource as? ContactDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.removeContactGroup(removeContactGroupEntity)
        
        switch results {
        case .success(let model):
            guard let model = model else {
                // TODO
                return .success(nil)
            }
            return RemoveContactGroupEntity(model)
        case .failure(let error):
            return RemoveContactGroupEntityFailure(error)
        }
    }
}
