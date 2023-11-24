
//
//  CancelMeetingEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class CancelMeetingEntity:  BaseEntity<CancelMeetingModel> {
    override init(_ model: CancelMeetingModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
}

