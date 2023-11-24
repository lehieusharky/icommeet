//
//  GetMeetingListRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class GetMeetingListRequestEntity {
    var x : String
    var vMeetId: String
    var userSecret: String
    var recentMeeting: String?
    var toDate: String?
    var recFrom: String?
    var recSize: String?
    var participants: String?
    var accessToken: String
    
    init(x: String,
         vMeetId: String,
         userSecret: String,
         recentMeeting: String,
         toDate: String,
         recFrom: String,
         recSize: String,
         participants: String,
         accessToken: String) {
        self.x = x
        self.vMeetId = vMeetId
        self.userSecret = userSecret
        self.recentMeeting = recentMeeting
        self.toDate = toDate
        self.recFrom = recFrom
        self.recSize = recSize
        self.participants = participants
        self.accessToken = accessToken
    }
}
