//
//  GetUserBasicInfoEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class GetUserBasicInfoEntity: BaseEntity<GetUserBasicInfoModel> {
    override init(_ model: GetUserBasicInfoModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
}
