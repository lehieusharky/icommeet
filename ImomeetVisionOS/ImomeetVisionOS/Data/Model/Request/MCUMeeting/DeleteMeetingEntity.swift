//
//  DeleteMeetingEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class DeleteMeetingEntity: BaseEntity<DeleteMeetingModel> {
    override init(_ model: DeleteMeetingModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
}

