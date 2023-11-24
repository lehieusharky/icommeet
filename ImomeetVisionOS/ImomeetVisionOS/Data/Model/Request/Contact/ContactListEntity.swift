//
//  ContactListEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class ContactListEntity: BaseEntity<ContactListModel> {
    override init(_ model: ContactListModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
}
