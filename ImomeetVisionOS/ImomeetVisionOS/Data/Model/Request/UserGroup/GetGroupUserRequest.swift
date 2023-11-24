//
//  GetGroupUserRequest.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class GetGroupUserRequest {
    var x : String
    var groupId : String?
    var size : String?
    var from : String?
    var accessToken: String?
    
    init(x: String,
         groupId: String,
         size: String,
         from: String,
         accessToken: String) {
        self.x = x
        self.groupId = groupId
        self.size = size
        self.from = from
        self.accessToken = accessToken
    }
}
