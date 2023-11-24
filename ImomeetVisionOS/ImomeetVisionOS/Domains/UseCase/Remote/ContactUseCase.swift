//
//  ContactUseCase.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 22/10/2023.
//

import Foundation

class ContactUseCase {
    
    private(set) var contactRepository: ContactRepository
    
    init(contactRepository: ContactRepository) {
        self.contactRepository = contactRepository
    }
    
    func getContactList(_ contactListEntity: ContactListRequest) async -> Result<ContactListEntity, XpertError> {
        do {
            let results = try await contactRepository.getContactList(contactListEntity)
            
            switch results {
            case .success(let success):
                return .success(ContactListEntity(success))
            case .failure(let failure):
                return .failure(failure)
            }
        } catch {
            let error = XpertError(error.localizedDescription)
            return .failure(error)
        }
    }
}
