//
//  AddContactRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class AddContactRequest {
    var x : String?
    var userId: String?
    var contact: String?
    var contactAlias: String?
    var uidType: String?
    var group: String?
    var groupId: String?
    var accessToken: String?
    
    init(x: String,
         userId: String,
         contact: String,
         contactAlias: String,
         uidType: String,
         group: String,
         groupId: String,
         accessToken: String) {
        self.x = x
        self.userId = userId
        self.contact = contact
        self.contactAlias = contactAlias
        self.uidType = uidType
        self.group = group
        self.groupId = groupId
        self.accessToken = accessToken
    }
}
