
//
//  ChangeUserPasswordRequest.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class ChangeUserPasswordRequest {
    var x : String
    var vMeetId : String
    var uidType : String
    var secret : String
    var accessToken: String
    
    init(x: String,
         vMeetId: String,
         uidType: String,
         secret: String,
         accessToken: String) {
        self.x = x
        self.vMeetId = vMeetId
        self.uidType = uidType
        self.secret = secret
        self.accessToken = accessToken
    }

    var toDict: [String: Any] {
        let mulDict: [String: Any] = [
            "x": request.x,
            "vMeetId" : request.vMeetId,
            "uid_type" : request.uidType,
            "secret" : request.secret,
            "accessToken" : request.accessToken,
        ]
        
        return mulDict
    }

    
}
