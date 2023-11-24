//
//  GetMeetingInfoRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class GetMeetingInfoRequest {
    var x : String
    var meetingId: String
    var meetingPassword: String
    var vMeetId: String
    var userSecret: String
    var accessToken: String
    
    init(x: String,
         meetingId: String,
         meetingPassword: String,
         vMeetId: String,
         userSecret: String,
         accessToken: String) {
        self.x = x
        self.meetingId = meetingId
        self.meetingPassword = meetingPassword
        self.vMeetId = vMeetId
        self.userSecret = userSecret
        self.accessToken = accessToken
    }
}
