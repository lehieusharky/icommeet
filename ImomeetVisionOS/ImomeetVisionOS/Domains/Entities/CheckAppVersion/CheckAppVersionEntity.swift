//
//  CheckAppVersionEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class CheckAppVersionEntity:  BaseEntity<CheckAppVersionModel> {
    override init(_ model: CheckAppVersionModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
}
