//
//  ContactsViewModel.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 19/10/2023.
//

import Foundation

class ContactsViewModel: BaseViewModel {
    @Published var entity: ContactListEntity?
    
    @Dependency
    var contactUseCase: ContactUseCase
    
    override func loadData() async {
        guard let userId = SFCacheDefault.shared.getUsername() else {
            return
        }
        
        let entity = await contactUseCase.getContactList(ContactListRequest(userId: userId))
        DispatchQueue.main.async { [weak self] in
            switch entity {
            case .success(let entity):
                self?.entity = entity
            case .failure(let failure):
                self?.error = failure.descriptionError
            }
        }
    }
}
