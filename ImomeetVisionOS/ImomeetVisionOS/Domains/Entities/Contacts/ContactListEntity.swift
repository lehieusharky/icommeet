//
//  ContactListEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol ContactListStateEntity {}

class ContactListEntityFailure: ContactListStateEntity {
    private(set) var error: XpertError?
    
    init(error: XpertError? = nil) {
        self.error = error
    }
}
class ContactListEntity : ContactListStateEntity {
    private(set) var model: ContactListModel
    
    init(_ model: ContactListModel) {
        self.model = model
    }
    
}
