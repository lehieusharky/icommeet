//
//  EditMCUMeetingRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class EditMCUMeetingRequest {
    var x : String
    var act : String
    var meetingId : String
    var topic : String?
    var description : String?
    var duration : String?
    var timezone : String?
    var startNow : String?
    var startTime : String?
    var quitOnChairmanLeft : String?
    var userList : String?
    var vmeetidList : String?
    var accessToken: String
    
    init(x: String,
         act: String,
         meetingId: String,
         topic: String,
         description: String,
         duration: String,
         timezone: String,
         startNow: String,
         startTime: String,
         quitOnChairmanLeft: String,
         userList: String,
         vmeetidList: String,
         accessToken: String) {
        self.x = x
        self.act = act
        self.meetingId = meetingId
        self.topic = topic
        self.description = description
        self.duration = duration
        self.timezone = timezone
        self.startNow = startNow
        self.startTime = startTime
        self.quitOnChairmanLeft = quitOnChairmanLeft
        self.userList = userList
        self.vmeetidList = vmeetidList
        self.accessToken = accessToken
    }

    var toDict: [String: Any] {
        let mulDict: [String: Any] = [
            "x": request.x,
            "act": request.act,
            "meeting_id": request.meetingId,
            "topic": request.topic,
            "description": request.description,
            "duration": request.duration,
            "timezone": request.timezone,
            "start_now": request.startNow,
            "start_time": request.startTime,
            "quit_on_chairman_left": request.quitOnChairmanLeft,
            "user_list": request.userList,
            "vmeetid_list": request.vmeetidList,
            "accessToken" : request.accessToken,
        ]
        
        return mulDict
    }

    
}
