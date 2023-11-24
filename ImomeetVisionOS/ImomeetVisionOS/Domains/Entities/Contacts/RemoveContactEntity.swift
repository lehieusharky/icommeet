//
//  RemoveContactEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol RemoveContactStateEntity {}

class RemoveContactEntityFailure: RemoveContactStateEntity {
    private(set) var error: XpertError?
    
    init(error: XpertError? = nil) {
        self.error = error
    }
}

class RemoveContactEntity: RemoveContactStateEntity {
    private(set) var model: RemoveContactModel?
    
    init(_ model: RemoveContactModel?) {
        self.model = model
    }
}
