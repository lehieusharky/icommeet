//
//  GetUserBasicInfoRequest.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class GetUserBasicInfoRequest {
    var x : String
    var vMeetId : String
    var userSecret : String
    var accessToken: String
    
    init(x: String,
         vMeetId: String,
         userSecret: String,
         accessToken: String) {
        self.x = x
        self.vMeetId = vMeetId
        self.userSecret = userSecret
        self.accessToken = accessToken
    }

    var toDict: [String: Any] {
        let mulDict: [String: Any] = [
            "x": request.x,
            "vMeetId": request.vMeetId,
            "user_secret": request.userSecret,
            "accessToken" : request.accessToken,
        ]
        
        return mulDict
    }

    
}
