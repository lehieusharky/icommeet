//
//  GetGroupUserEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class GetGroupUserEntity: BaseEntity<GetGroupUserModel> {
    override init(_ model: GetGroupUserModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
}
