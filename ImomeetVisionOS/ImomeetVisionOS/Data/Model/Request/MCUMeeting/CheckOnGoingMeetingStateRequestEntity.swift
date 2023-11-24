//
//  CheckOnGoingMeetingStateRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class CheckOnGoingMeetingStateRequestEntity {
    var x : String
    var userId : String
    var uidType : String?
    var accessToken: String
    
    init(x: String,
         userId: String,
         uidType: String,
         accessToken: String) {
        self.x = x
        self.userId = userId
        self.uidType = uidType
        self.accessToken = accessToken
    }
}
