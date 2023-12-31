//
//  ChangeContactGroupNameRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class ChangeContactGroupNameRequest {
    var x : String?
    var userId: String?
    var group: String?
    var newGroup: String?
    var accessToken: String?
    
    init(x: String,
         userId: String,
         group: String,
         newGroup: String,
         accessToken: String) {
        self.x = x
        self.userId = userId
        self.group = group
        self.newGroup = newGroup
        self.accessToken = accessToken
    }

    var toDict: [String: Any] {
        let mulDict: [String: Any] = [
            "x": request.x,
            "user_id": request.userId,
            "group": request.group,
            "new_group": request.newGroup,
            "accessToken" : request.accessToken,
        ]
        
        return mulDict
    }

    
}
