//
//  RemoveContactGroupRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class RemoveContactGroupRequestEntity {
    var x : String
    var userId: String
    var group: String
    var accessToken: String
    
    init(x: String,
         userId: String,
         group: String,
         accessToken: String) {
        self.x = x
        self.userId = userId
        self.group = group
        self.accessToken = accessToken
    }
}
