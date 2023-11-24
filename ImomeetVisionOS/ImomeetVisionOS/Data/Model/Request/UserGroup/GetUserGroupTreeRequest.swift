//
//  GetUserGroupTreeRequest.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class GetUserGroupTreeRequest {
    var x : String
    var userId : String?
    var uidType : String?
    var userSecret : String?
    var accessToken: String?
    
    init(x: String,
         userId: String,
         uidType: String,
         userSecret: String,
         accessToken: String) {
        self.x = x
        self.userId = userId
        self.uidType = uidType
        self.userSecret = userSecret
        self.accessToken = accessToken
    }

    var toDict: [String: Any] {
        let mulDict: [String: Any] = [
            "x": request.x,
            "user_id": request.userId,
            "uid_type": request.uidType,
            "user_secret": request.userSecret,
            "accessToken" : request.accessToken,
        ]
        
        return mulDict
    }

    
}
