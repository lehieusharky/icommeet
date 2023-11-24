//
//  GetUserListEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class GetUserListEntity: BaseEntity<GetUserListModel> {
    override init(_ model: GetUserListModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
}

