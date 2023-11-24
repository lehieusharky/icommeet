//
//  ChangeUserPasswordEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class ChangeUserPasswordEntity: BaseEntity<ChangeUserPasswordModel> {
    override init(_ model: ChangeUserPasswordModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
}

