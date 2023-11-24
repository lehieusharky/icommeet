//
//  GetMeetingListRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class GetMeetingListRequest {
    var x: String {
        return isNeedPassword ? "745" : "740"
    }
    
    var isNeedPassword: Bool
    var vMeetId: String
    var userSecret: String
    var recentMeeting: String?
    var toDate: String?
    var recFrom: String?
    var recSize: String?
    var participants: String?
    var accessToken: String
    
    init(isNeedPassword: Bool = false,
         vMeetId: String,
         userSecret: String,
         recentMeeting: String? = nil,
         toDate: String? = nil,
         recFrom: String? = nil,
         recSize: String? = nil,
         participants: String? = nil,
         accessToken: String) {
        self.isNeedPassword = isNeedPassword
        self.vMeetId = vMeetId
        self.userSecret = userSecret
        self.recentMeeting = recentMeeting
        self.toDate = toDate
        self.recFrom = recFrom
        self.recSize = recSize
        self.participants = participants
        self.accessToken = accessToken
    }
    
    private var toDict: [String: Any] {
        let mulDict: [String: Any] = [
            "x": x,
            "vMeetId": vMeetId,
            "user_secret": userSecret,
            "recent_meeting": recentMeeting ?? "",
            "to_date": toDate ?? "",
            "rec_from": recFrom ?? "",
            "rec_size": recSize ?? "",
            "participants": participants ?? ""
        ]
        
        return mulDict
    }
    
    var toBody: String {
        guard let data = NgnWebServiceUtils.newWebAPIGetStringEncrypted(fromDict: toDict, accessToken: accessToken),
              let encodeString = NgnStringUtils.urlEncodedString(data) else {
            return ""
        }
        
        return "x=\(encodeString)"
    }
}
