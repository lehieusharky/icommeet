//
//  RemoveContactGroupEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

    protocol RemoveContactGroupStateEntity {}

    class RemoveContactGroupEntityFailure: RemoveContactGroupStateEntity {
        private(set) var error: XpertError?
        
        init(error: XpertError? = nil) {
            self.error = error
        }
    }

    class RemoveContactGroupEntity: RemoveContactGroupStateEntity {
        private(set) var model: RemoveContactGroupModel?
        
        init(_ model: RemoveContactGroupModel?) {
            self.model = model
        }
    }
