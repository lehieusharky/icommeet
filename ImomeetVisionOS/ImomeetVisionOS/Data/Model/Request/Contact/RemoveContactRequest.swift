//
//  RemoveContactRequest.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class RemoveContactRequest {
    var x : String
    var userId: String
    var contact: String
    var uidType : String
    var accessToken: String
    
    init(x: String,
         userId: String,
         contact: String,
         uidType: String,
         accessToken: String) {
        self.x = x
        self.userId = userId
        self.contact = contact
        self.uidType = uidType
        self.accessToken = accessToken
    }
}
