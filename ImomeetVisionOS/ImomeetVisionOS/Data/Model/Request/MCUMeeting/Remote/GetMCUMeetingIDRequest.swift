//
//  GetMCUMeetingIDRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class GetMCUMeetingIDRequest {
    var x : String
    var meetingId: String
    var userId: String?
    var accessToken: String
    
    init(x: String,
         meetingId: String,
         userId: String,
         accessToken: String) {
        self.x = x
        self.meetingId = meetingId
        self.userId = userId
        self.accessToken = accessToken
    }
}
