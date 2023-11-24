//
//  GetMeetingListEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class GetMeetingListEntity: BaseEntity<GetMeetingListModel> {
    override init(_ model: GetMeetingListModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
    
    public var meetingInfoList: [GetMeetingInfoEntity] {
        guard let success = model?.isGetMeetingListSuccess,
              success,
              let meetings = model?.meetings else {
            return []
        }
                
        return meetings.compactMap({GetMeetingInfoEntity($0)})
    }
}

