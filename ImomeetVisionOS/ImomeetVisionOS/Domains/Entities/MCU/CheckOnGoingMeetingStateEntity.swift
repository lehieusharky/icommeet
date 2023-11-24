//
//  CheckOnGoingMeetingStateEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class CheckOnGoingMeetingStateEntity: BaseEntity<CheckOnGoingMeetingStateModel> {
    override init(_ model: CheckOnGoingMeetingStateModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
}

