//
//  UpdateUserBasicInfoEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class UpdateUserBasicInfoEntity: BaseEntity<UpdateUserBasicInfoModel> {
    override init(_ model: UpdateUserBasicInfoModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
}
