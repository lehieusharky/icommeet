//
//  ContactListRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class ContactListRequestEntity {
    var x : String?
    var userId: String?
    var accessToken: String?
    
    init(x: String,
         userId: String,
         accessToken: String) {
        self.x = x
        self.userId = userId
        self.accessToken = accessToken
    }
}
