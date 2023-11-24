//
//  ExtendOnGoingMCUMeetingTimeRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class ExtendOnGoingMCUMeetingTimeRequestEntity {
    var x : String
    var act : String
    var meetingId : String
    var addTime : String
    var userId : String
    var uidType : String?
    var userSecret : String
    var accessToken: String
    
    init(x: String,
         act: String,
         meetingId: String,
         addTime: String,
         userId: String,
         uidType: String,
         userSecret: String,
         accessToken: String) {
        self.x = x
        self.act = act
        self.meetingId = meetingId
        self.addTime = addTime
        self.userId = userId
        self.uidType = uidType
        self.userSecret = userSecret
        self.userSecret = userSecret
        self.accessToken = accessToken
    }
}
