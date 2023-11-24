//
//  UpdateRemoveUserAvatarRequest.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class UpdateRemoveUserAvatarRequest {
    var x : String?
    var userId : String?
    var userSecret : String?
    var act : String?
    var userPhoto : String?
    var accessToken: String?
    
    init(x: String,
         userId: String,
         userSecret: String,
         act: String,
         userPhoto: String,
         accessToken: String) {
        self.x = x
        self.userId = userId
        self.userSecret = userSecret
        self.act = act
        self.userPhoto = userPhoto
        self.accessToken = accessToken
    }

    var toDict: [String: Any] {
        let mulDict: [String: Any] = [
            "x": request.x,
            "user_id": request.userId,
            "user_secret": request.userSecret,
            "act": request.act,
            "user_photo": request.userPhoto,
            "accessToken" : request.accessToken,
        ]
        
        return mulDict
    }


    
}
