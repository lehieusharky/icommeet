//
//  InviteUserDuringMeetingRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class InviteUserDuringMeetingRequest {
    var x : String
    var meetingId : String
    var userId : String
    var uidType : String?
    var userSecret : String
    var invitee : String
    var inviteeType : String?
    var invitedMobilephone : String?
    var accessToken: String?
    
    init(x: String,
         meetingId: String,
         userId: String,
         uidType: String,
         userSecret: String,
         invitee: String,
         inviteeType: String,
         invitedMobilephone: String,
         accessToken: String) {
        self.x = x
        self.meetingId = meetingId
        self.userId = userId
        self.uidType = uidType
        self.userSecret = userSecret
        self.invitee = invitee
        self.inviteeType = inviteeType
        self.invitedMobilephone = invitedMobilephone
        self.accessToken = accessToken
    }
}
