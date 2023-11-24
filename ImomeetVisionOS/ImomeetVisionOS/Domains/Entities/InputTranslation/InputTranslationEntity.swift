//
//  InputTranslationEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class InputTranslationEntity: BaseEntity<InputTranslationModel> {
    override init(_ model: InputTranslationModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
}

