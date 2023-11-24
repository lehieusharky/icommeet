//
//  EditMCUMeetingEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class EditMCUMeetingEntity: BaseEntity<EditMCUMeetingModel> {
    override init(_ model: EditMCUMeetingModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
}

