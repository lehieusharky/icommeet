//
//  ExtendOnGoingMCUMeetingTimeEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class ExtendOnGoingMCUMeetingTimeEntity: BaseEntity<ExtendOnGoingMCUMeetingTimeModel> {
    override init(_ model: ExtendOnGoingMCUMeetingTimeModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
}

