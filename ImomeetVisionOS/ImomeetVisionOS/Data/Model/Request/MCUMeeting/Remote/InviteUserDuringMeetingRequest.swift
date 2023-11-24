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

    var toDict: [String: Any] {
        let mulDict: [String: Any] = [
            "x": request.x,
            "meeting_id": request.meetingId,
            "user_id": request.userId,
            "uid_type": request.uidType,
            "user_secret": request.userSecret,
            "invitee": request.invitee,
            "invitee_type": request.inviteeType,
            "invited_mobilephone": request.invitedMobilephone,
            "accessToken" : request.accessToken,
        ]
        
        return mulDict
    }

    
}
