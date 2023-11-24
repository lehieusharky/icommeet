
//
//  GetMeetingInfoEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class GetMeetingInfoEntity: BaseEntity<MeetingInfoModel>, Identifiable {
    override init(_ model: MeetingInfoModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
    
    public var meetingID: String {
        return model?.meetingId ?? ""
    }
    
    public var participants: String {
        guard let participants = model?.participants else {
            return ""
        }
        
        var name: String = ""
        participants.forEach { model in
            name += ", \(model.name ?? "")"
        }
        
        return name
    }
    
    public var meetingName: String {
        return "125 139"
    }
}
