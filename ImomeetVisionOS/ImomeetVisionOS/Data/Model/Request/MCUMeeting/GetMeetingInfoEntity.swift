
//
//  GetMeetingInfoEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class GetMeetingInfoEntity: BaseEntity<GetMeetingInfoModel> {
    override init(_ model: GetMeetingInfoModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
}
