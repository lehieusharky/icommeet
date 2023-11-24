//
//  CheckOnGoingMeetingStateRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class CheckOnGoingMeetingStateRequest {
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
    
    var toDict: [String: Any] {
        let mulDict: [String: Any] = [
            "x": request.x,
            "user_id": request.userId,
            "uid_type": request.uidType,
            "accessToken" : request.accessToken,
        ]
        
        return mulDict
    }
}
