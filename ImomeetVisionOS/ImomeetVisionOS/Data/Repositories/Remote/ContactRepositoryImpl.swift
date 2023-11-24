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
    
    func getContactList(_ contactListEntity: ContactListRequest) async throws -> Result<ContactListModel, XpertError> {
        guard let dataSource = dataSource as? ContactDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        guard let results = try? await dataSource.getContactList(contactListEntity) else {
            return .failure(XpertError(.error_100))
        }
        
        return results
    }
    
    func getContactInfo(_ contactInfoEntity: ContactInfoRequest) async throws -> Result<ContactInfoModel?, XpertError> {
        guard let dataSource = dataSource as? ContactDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.getContactInfo(contactInfoEntity)
        
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

    func removeContact(_ removeContactEntity: RemoveContactRequest) async throws -> Result<RemoveContactModel?, XpertError> {
        guard let dataSource = dataSource as? ContactDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.removeContact(removeContactEntity)
        
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


    func addContact(_ addContactEntity: AddContactRequest) async throws -> Result<AddContactModel?, XpertError> {
        guard let dataSource = dataSource as? ContactDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.addContact(addContactEntity)
        
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

    func changeContactGroupName(_ changeContactGroupNameEntity: ChangeContactGroupNameRequest) async throws -> Result<ChangeContactGroupNameModel?, XpertError> {
        guard let dataSource = dataSource as? ContactDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.changeContactGroupName(changeContactGroupNameEntity)
        
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

    func removeContactGroup(_ removeContactGroupEntity: RemoveContactGroupRequest) async throws -> Result<RemoveContactGroupModel?, XpertError> {
         guard let dataSource = dataSource as? ContactDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.removeContactGroup(removeContactGroupEntity)
        
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
