//
//  MCUMeetingCreationRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class MCUMeetingCreationRequest {
    var x : String
    var act : String
    var topic : String
    var description : String?
    var chairman : String?
    var chairmanVmeetid : String?
    var password : String?
    var quitOnChairmanLeft : String?
    var duration : String?
    var timezone : String?
    var startNow : String?
    var startTime : String?
    var sendSms : String?
    var userList : String?
    var vmeetidList : String?
    var forceCreate : String?
    var allowMultiple : String?
    var noVideo : String?
    var extra : String?
    var accessToken: String
    
    init(x: String,
         act: String,
         topic: String,
         description: String,
         chairman: String,
         chairmanVmeetid: String,
         password: String,
         quitOnChairmanLeft: String,
         duration: String,
         timezone: String,
         startNow: String,
         startTime: String,
         sendSms: String,
         userList: String,
         vmeetidList: String,
         forceCreate: String,
         allowMultiple: String,
         noVideo: String,
         extra: String,
         accessToken: String) {
        self.x = x
        self.act = act
        self.topic = topic
        self.description = description
        self.chairman = chairman
        self.chairmanVmeetid = chairmanVmeetid
        self.password = password
        self.quitOnChairmanLeft = quitOnChairmanLeft
        self.duration = duration
        self.timezone = timezone
        self.startNow = startNow
        self.startTime = startTime
        self.sendSms = sendSms
        self.userList = userList
        self.vmeetidList = vmeetidList
        self.forceCreate = forceCreate
        self.allowMultiple = allowMultiple
        self.noVideo = noVideo
        self.extra = extra
        self.accessToken = accessToken
    }
}
