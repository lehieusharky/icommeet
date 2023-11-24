//
//  UpdateUserBasicInfoRequest.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class UpdateUserBasicInfoRequest {
    var x : String
    var vMeetId : String
    var uidType : String
    var secret : String
    var userName : String?
    var userEmail : String?
    var userPhone : String?
    var userMobile : String?
    var userTitle : String?
    var dob : String?
    var priority : String?
    var gender : String?
    var country : String?
    var state : String?
    var city : String?
    var accessToken: String?
    
    init(x: String,
         vMeetId: String,
         uidType: String,
         secret: String,
         userName: String,
         userEmail: String,
         userPhone: String,
         userMobile: String,
         userTitle: String,
         dob: String,
         priority: String,
         gender: String,
         country: String,
         state: String,
         city: String,
         accessToken: String) {
        self.x = x
        self.vMeetId = vMeetId
        self.uidType = uidType
        self.secret = secret
        self.userName = userName
        self.userEmail = userEmail
        self.userPhone = userPhone
        self.userMobile = userMobile
        self.userTitle = userTitle
        self.dob = dob
        self.priority = priority
        self.gender = gender
        self.country = country
        self.state = state
        self.city = city
        self.accessToken = accessToken
    }

    var toDict: [String: Any] {
        let mulDict: [String: Any] = [
            "x": request.x,
            "vMeetId" : request.vMeetId,
            "uid_type" : request.uidType,
            "secret" : request.secret,
            "user_name" : request.userName,
            "user_email" : request.userEmail,
            "user_phone" : request.userPhone,
            "user_mobile" : request.userMobile,
            "user_title" : request.userTitle,
            "dob" : request.dob,
            "priority" : request.priority,
            "gender" : request.gender,
            "country" : request.country,
            "state" : request.state,
            "city" : request.city,
            "accessToken" : request.accessToken,
        ]
        
        return mulDict
    }

    
}
