//
//  UpdateRemoveUserAvatarEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class UpdateRemoveUserAvatarEntity: BaseEntity<UpdateRemoveUserAvatarModel> {
    override init(_ model: UpdateRemoveUserAvatarModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
}

