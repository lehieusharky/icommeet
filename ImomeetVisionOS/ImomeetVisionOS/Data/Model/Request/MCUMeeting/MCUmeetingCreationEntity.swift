//
//  MCUMeetingCreationEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class MCUMeetingCreationEntity: BaseEntity<MCUMeetingCreationModel> {
    override init(_ model: MCUMeetingCreationModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
}
